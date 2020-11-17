import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget formNama() {
  return Container(
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
          width: 2.0,
          color: Color(0xFF7B417B)),
    ),
    child: TextFormField(
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
        hintText: 'Nama Kegiatan',
        hintStyle: TextStyle(
          fontSize: 26,
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
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
          width: 2.0,
          color: Color(0xFF7B417B)),
    ),
    child: TextFormField(
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
          fontSize: 26,
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
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
          width: 2.0,
          color: Color(0xFF7B417B)),
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
          fontSize: 26,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2,
          color: colorMainPurple,
        ),
      ),
    ),
  );
}

class BuatKegiatan extends StatelessWidget {
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
                fontSize: 26,
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
                    spasiBaris(50.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.redAccent)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          spasiBaris(20.0),
                          formNama(),
                          spasiBaris(20.0),
                          formPengaju(),
                          spasiBaris(20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              buttonUpload(),
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
                          spasiBaris(20.0),
                          formFile(),
                          spasiBaris(20.0),
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
