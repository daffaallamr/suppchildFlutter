import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:flutter/services.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class BuatKegiatan extends StatefulWidget {
  @override
  _BuatKegiatanState createState() => _BuatKegiatanState();
}

class _BuatKegiatanState extends State<BuatKegiatan> {
  File selectedFile;
  Response response;
  Dio dio = new Dio();
  String fileName;

  // Controller
  TextEditingController controllerFile;
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPengaju = new TextEditingController();

  _openFileExplorer() async {
    FilePickerResult selectedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    PlatformFile file = selectedFile.files.first;

    setState(() {
      fileName = file.path != null ? file.path.split('/').last : '';
      controllerFile = new TextEditingController(text: fileName);
    });
  }

  _unggahFile() async {
    String uploadurl = "http://suppchild.xyz/API/daerah/buatKegiatan.php";

    FormData formdata = FormData.fromMap({
      "nama": controllerNama.text,
      "pengaju": controllerPengaju.text,
      "file_ajuan": await MultipartFile.fromFile(selectedFile.path,
          filename: basename(selectedFile.path)
          //show only filename from path
          ),
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
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
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
                fontSize: 26,
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
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    Widget formNama() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: TextField(
          controller: controllerNama,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Nama Kegiatan',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 8,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
        ),
      );
    }

    Widget formPengaju() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: TextField(
          controller: controllerPengaju,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            border: InputBorder.none,
            hintText: 'Daerah Pengaju',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 8,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
        ),
      );
    }

    Widget formFile() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: TextField(
          controller: controllerFile,
          readOnly: true,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            border: InputBorder.none,
            hintText: 'Nama File',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 8,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
        ),
      );
    }

    final size = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Buat Kegiatan'),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: size.size.width / 1.1,
              // decoration: BoxDecoration(
              //     // border: Border.all(color: colorMainPurple),
              // ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Ajukan Kegiatan',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: colorMainPurple,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.redAccent)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          spasiBaris(5.0),
                          formNama(),
                          spasiBaris(5.0),
                          formPengaju(),
                          spasiBaris(3.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              buttonAmbilFile(),
                              Text(
                                '*.doc / .pdf',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          spasiBaris(3.0),
                          formFile(),
                          spasiBaris(8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buttonUnggah(),
                              buttonBatal(),
                            ],
                          ),
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
