import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget dataAnak(judul, data) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$judul',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          Text(
            '$data',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget petunjukData() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Petunjuk Angka Kondisi ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          Text(
            '5 -> Sangat Baik',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
          spasiBaris(10.0),
          Text(
            '4 -> Baik',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
          spasiBaris(10.0),
          Text(
            '3 -> Cukup',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
          spasiBaris(10.0),
          Text(
            '2 -> Kurang',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
          spasiBaris(10.0),
          Text(
            '1 -> Sangat Kurang',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dataKondisi(kondisi, data) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$kondisi',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: colorMainOrange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$data',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class DetaiKondisiAnak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Kondisi Anak'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  spasiBaris(20.0),
                  Text(
                    'Informasi Anak Binaan',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                      color: colorMainPurple,
                    ),
                  ),
                  spasiBaris(30.0),
                  petunjukData(),
                  spasiBaris(30.0),
                  dataAnak('Nama Anak:', 'Ananda Agustinus'),
                  spasiBaris(20.0),
                  dataKondisi("Kesehatan:", "5"),
                  dataKondisi("Pendidikan:", "4"),
                  dataKondisi("Ekonomi:", "3"),
                  spasiBaris(20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
