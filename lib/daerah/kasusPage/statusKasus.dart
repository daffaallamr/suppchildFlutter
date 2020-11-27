import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget dataKasus(judul, data) {
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

class StatusKasus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Status Laporan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  spasiBaris(40.0),
                  Text(
                    'Detail Kasus',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                      color: colorMainPurple,
                    ),
                  ),
                  spasiBaris(40.0),
                  dataKasus('Nama Anak:', 'Ananda Agustinus'),
                  dataKasus('Tempat Kasus:', 'Lamongan Keluarahan Bandar Kidul Rt 08 Rw 05'),
                  dataKasus('Detail Kasus:', 'Pelecehan seksual yang dilakukan oleh warga Kota Lamongan kepada anak dibawah umur.'),
                  dataKasus('Status:', 'Selesai'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
