import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class UploadKegiatan extends StatefulWidget {
  final List list;
  final int index;
  UploadKegiatan({this.list, this.index});

  @override
  _UploadKegiatanState createState() =>
      _UploadKegiatanState(list: list, index: index);
}

class _UploadKegiatanState extends State<UploadKegiatan> {
  final List list;
  final int index;
  _UploadKegiatanState({this.list, this.index});

  // File picker
  PlatformFile _selectedFile;
  Response response;
  Dio dio = new Dio();
  String fileName;
  String namaFotoDB;
  bool berhasil = true;
  String msg = '';

  // Controller
  TextEditingController controllerFileLaporan;
  TextEditingController controllerFoto;
  TextEditingController controllerLokasiFoto;

  // FIle Picker
  Future _openFileExplorer() async {
    FilePickerResult selectedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    PlatformFile file = selectedFile.files.first;

    setState(() {
      _selectedFile = file;
      fileName = file.path != null ? file.path.split('/').last : '';
      controllerFileLaporan = new TextEditingController(text: fileName);
    });
  }

  //Image Picker
  File _image;
  String imageName;
  Future ambilFoto() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
      imageName = _image.path.split('/').last;
      controllerFoto = new TextEditingController(text: imageName);
    });
  }

  _checkForm() {
    if (fileName == null) {
      setState(() {
        msg = "File Laporan Belum Diunggah!";
        berhasil = false;
        print(msg);
      });
    } else if (imageName == null) {
      setState(() {
        msg = "Belum Mengunggah Foto!";
        berhasil = false;
        print(msg);
      });
    } else {
      msg = "";
      berhasil = true;
      print('berhasil Upload!');
    }
  }

  Widget alertGagal() {
    return Center(
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: SizeConfig.safeBlockHorizontal * 4,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Future uploadImage() async {
    //show your own loading or progressing code here

    String uploadurl = "http://suppchild.xyz/API/daerah/uploadFotoLaporan.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    try {
      List<int> imageBytes = _image.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      //convert file image to Base64 encoding
      var response = await http.post(uploadurl, body: {
        'foto_laporan': baseimage,
        'nama_foto': imageName,
      });
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          //check error sent from server
          print(jsondata["msg"]);
          //if error return from server, show message from server
        } else {
          print("Upload successful");
        }
      } else {
        print("Error during connection to server");
        //there is error during connecting to server,
        //status code might be 404 = url not found
      }
    } catch (e) {
      print("Error during converting to Base64");
      //there is error during converting file image to base64 encoding.
    }
  }

  // Gps things
  Position _currentPosition;
  String _currentAddress;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
        controllerLokasiFoto = new TextEditingController(text: _currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  Future _unggahFile() async {
    String uploadurl = "http://suppchild.xyz/API/daerah/uploadLaporan.php";

    FormData formdata = FormData.fromMap({
      "id": widget.list[widget.index]['id'],
      "file_laporan": await MultipartFile.fromFile(_selectedFile.path,
          filename: basename(_selectedFile.path)
          //show only filename from path
          ),
      "nama_foto": controllerFoto.text,
      "lokasi": controllerLokasiFoto.text,
    });

    response = await dio.post(uploadurl, data: formdata);

    if (response.statusCode == 200) {
      print(response.toString());
      print("Upload successful");
    } else {
      print("Error during connection to server.");
    }
  }

  _checkUdahUpload() {
    if (widget.list[widget.index]['file_laporan'] != null) {
      controllerFileLaporan = new TextEditingController(
          text: widget.list[widget.index]['file_laporan']);
      namaFotoDB = widget.list[widget.index]['foto_laporan'];
    }
  }

  @override
  void initState() {
    _checkUdahUpload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget dataLaporan(judul, data) {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Card(
          elevation: 4.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$judul',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorMainPurple,
                  ),
                ),
                spasiBaris(0.5),
                Text(
                  '$data',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorSecondPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget formFile() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: controllerFileLaporan,
          autofocus: false,
          readOnly: true,
          cursorColor: colorMainPurple,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Nama File',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget buttonAmbilFile() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 45,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              _openFileExplorer();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: colorSecondPurple,
            child: Text(
              'Unggah File',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    Widget textFoto() {
      return Center(
        child: Text(
          'Belum ada Foto',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      );
    }

    Widget containerFoto() {
      return _image != null
          ? Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: new DecorationImage(
                    image: FileImage(_image), fit: BoxFit.fill),
              ),
            )
          : namaFotoDB != null
              ? Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: new DecorationImage(
                        image: NetworkImage(
                            'http://suppchild.xyz/API/foto_laporan/$namaFotoDB'),
                        fit: BoxFit.fill),
                  ),
                )
              : textFoto();
    }

    Widget buttonKamera() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 6.5,
        decoration: BoxDecoration(
          color: colorSecondPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          icon: Icon(Icons.camera_alt),
          color: Colors.white,
          onPressed: () {
            ambilFoto();
            _getCurrentLocation();
          },
          iconSize: SizeConfig.safeBlockVertical * 4,
        ),
      );
    }

    Widget buttonUnggah() {
      Widget buttonbatal() {
        return Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.red,
              child: Text(
                'Tidak',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        );
      }

      Widget buttonYakin() {
        return Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                _checkForm();
                if (berhasil == false) {
                  Navigator.pop(context);
                } else if (berhasil == true) {
                  _unggahFile();
                  uploadImage();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RootDaerah(selectedScreen: 'kegiatan'),
                      ));
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: colorMainPurple,
              child: Text(
                'Ya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        );
      }

      Widget contModal() {
        return AlertDialog(
          content: Container(
            height: SizeConfig.safeBlockHorizontal * 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                spasiBaris(1.0),
                Text(
                  'Apakah Anda Yakin?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                spasiBaris(2.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonYakin(),
                    buttonbatal(),
                  ],
                ),
              ],
            ),
          ),
        );
      }

      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => contModal(),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: colorMainPurple,
            child: Text(
              'Unggah',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonBatal() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Colors.redAccent,
            child: Text(
              'Batal',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Upload Laporan'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                spasiBaris(2.0),
                Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage(
                              "assets/image/approveKegiatan.png"),
                          fit: BoxFit.fill),
                    ),
                    height: SizeConfig.safeBlockVertical * 25,
                    width: SizeConfig.safeBlockHorizontal * 60),
                spasiBaris(2.0),
                Text(
                  'Laporan Kegiatan',
                  style: TextStyle(
                    color: colorMainPurple,
                    fontSize: SizeConfig.safeBlockHorizontal * 7,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                spasiBaris(3.0),
                dataLaporan(
                    'Nama Kegiatan:', widget.list[widget.index]['nama']),
                spasiBaris(2.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buttonAmbilFile(),
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 30,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '*.doc / .pdf',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                spasiBaris(2.0),
                formFile(),
                spasiBaris(8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Foto Kegiatan',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                        fontWeight: FontWeight.w600,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(1.5),
                    Container(
                      height: SizeConfig.safeBlockVertical * 65,
                      width: SizeConfig.safeBlockHorizontal * 80,
                      child: Card(
                          color: Colors.grey[100],
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: containerFoto()),
                    ),
                  ],
                ),
                spasiBaris(3.0),
                buttonKamera(),
                spasiBaris(2.0),
                alertGagal(),
                spasiBaris(6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonUnggah(),
                    buttonBatal(),
                  ],
                ),
                spasiBaris(4.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
