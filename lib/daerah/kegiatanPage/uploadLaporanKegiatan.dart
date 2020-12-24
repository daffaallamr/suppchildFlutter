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
  File selectedFile;
  Response response;
  Dio dio = new Dio();
  String fileName;

  // Controller
  TextEditingController controllerFileLaporan;
  TextEditingController controllerFoto;
  TextEditingController controllerLokasiFoto;

  // FIle Picker
  _openFileExplorer() async {
    selectedFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    setState(() {
      fileName =
          selectedFile.path != null ? selectedFile.path.split('/').last : '';
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

  Future<void> uploadImage() async {
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

  _unggahFile() async {
    String uploadurl = "http://suppchild.xyz/API/daerah/uploadLaporan.php";

    FormData formdata = FormData.fromMap({
      "id": widget.list[widget.index]['id'],
      "file_laporan": await MultipartFile.fromFile(selectedFile.path,
          filename: basename(selectedFile.path)
          //show only filename from path
          ),
      "nama_foto": controllerFoto.text,
      "lokasi": controllerLokasiFoto.text,
    });

    response = await dio.post(uploadurl, data: formdata);

    if (response.statusCode == 200) {
      print(response.toString());
      //print response from server
    } else {
      print("Error during connection to server.");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget judulKegiatan(judul) {
      return Text(
        '$judul',
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 7,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: colorMainOrange,
        ),
      );
    }

    Widget dataJudul() {
      return Container(
        height: SizeConfig.safeBlockVertical * 15,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.transparent,
          // borderRadius: BorderRadius.circular(12),
          // border: Border.all(
          //     width: 2.0,
          //     color: Color(0xFF7B417B)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nama Kegiatan:',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 7,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
              spasiBaris(1.0),
              judulKegiatan(list[index]['nama']),
            ],
          ),
        ),
      );
    }

    Widget formFile() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Container(
          height: SizeConfig.safeBlockVertical * 8,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
          ),
          child: TextField(
            controller: controllerFileLaporan,
            readOnly: true,
            autofocus: false,
            cursorColor: colorMainPurple,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: SizeConfig.safeBlockHorizontal * 7,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              border: InputBorder.none,
              hintText: 'Nama File',
              hintStyle: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 7,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
                color: colorMainPurple,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonAmbilFile() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          child: RaisedButton(
            onPressed: () {
              _openFileExplorer();
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              '+ FILE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    Widget containerFoto() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
        child: Container(
          height: SizeConfig.safeBlockVertical * 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2.0,
              color: colorMainOrange,
            ),
          ),
          child: Center(
            child: _image == null
                ? Text('Belum ada foto',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: colorMainOrange,
                    ))
                : Image.file(_image),
          ),
        ),
      );
    }

    Widget buttonKamera() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: colorMainPurple,
              borderRadius: BorderRadius.circular(5),
            ),
            width: double.infinity,
            child: IconButton(
              icon: Icon(Icons.camera_alt),
              color: Colors.white,
              onPressed: () {
                ambilFoto();
                _getCurrentLocation();
              },
              iconSize: 30,
            ),
          ),
        ),
      );
    }

    Widget buttonUnggah() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          child: RaisedButton(
            onPressed: () {
              _unggahFile();
              uploadImage();
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              'UNGGAH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
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
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainOrange,
            child: Text(
              'BATAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    final size = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Upload Laporan'),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: size.size.width / 1.1,
              // decoration: BoxDecoration(
              //     // border: Border.all(color: colorMainPurple),
              // ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.redAccent)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          dataJudul(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                            child: Text(
                              'Laporan Kegiatan:',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: colorMainPurple,
                              ),
                            ),
                          ),
                          formFile(),
                          spasiBaris(3.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              buttonAmbilFile(),
                              Text(
                                '*.doc / .pdf',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          spasiBaris(5.0),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                            child: Text(
                              'Foto Kegiatan:',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: colorMainPurple,
                              ),
                            ),
                          ),
                          containerFoto(),
                          spasiBaris(3.0),
                          buttonKamera(),
                          spasiBaris(10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buttonUnggah(),
                              buttonBatal(),
                            ],
                          ),
                          spasiBaris(8.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
