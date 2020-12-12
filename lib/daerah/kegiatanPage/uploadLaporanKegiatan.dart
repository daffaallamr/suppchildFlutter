import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget judulKegiatan(judul) {
  return Text(
    '$judul',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      color: colorMainOrange,
    ),
  );
}

Widget dataJudul() {
  return Container(
    height: 120,
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
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          judulKegiatan('Agustusan di Desa'),
        ],
      ),
    ),
  );
}

Widget formFile() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
    child: Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
      ),
      child: TextFormField(
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
            fontSize: 24,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.2,
            color: colorMainPurple,
          ),
        ),
      ),
    ),
  );
}

class UploadKegiatan extends StatefulWidget {
  final List list;
  final int index;
  UploadKegiatan({this.list, this.index});

  @override
  _UploadKegiatanState createState() => _UploadKegiatanState();
}

class _UploadKegiatanState extends State<UploadKegiatan> {
  File _image;
  Future ambilFoto() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonUpload() {
      return Center(
        child: Container(
          width: 120,
          child: RaisedButton(
            onPressed: () {
              //Proses
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
          height: 420,
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
              onPressed: ambilFoto,
              iconSize: 30,
            ),
          ),
        ),
      );
    }

    Widget buttonUnggah() {
      return Center(
        child: Container(
          width: 160,
          child: RaisedButton(
            onPressed: () {
              //Proses
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
          width: 160,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
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
                          spasiBaris(20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              buttonUpload(),
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 60, 12, 12),
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
                          spasiBaris(5.0),
                          buttonKamera(),
                          spasiBaris(40.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buttonUnggah(),
                              buttonBatal(),
                            ],
                          ),
                          spasiBaris(40.0),
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
