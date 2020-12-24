import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

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
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(1.0),
          Text(
            '$data',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 6,
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
  final List list;
  final int index;
  StatusKasus({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Status Laporan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  spasiBaris(5.0),
                  Text(
                    'Detail Kasus',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: SizeConfig.safeBlockHorizontal * 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                      color: colorMainPurple,
                    ),
                  ),
                  spasiBaris(8.0),
                  dataKasus('Nama Anak:', list[index]['nama']),
                  dataKasus('Tempat Kasus:', list[index]['tempat']),
                  dataKasus('Detail Kasus:', list[index]['detail']),
                  dataKasus(
                      'Status:',
                      list[index]['status'] == null
                          ? 'Belum ada status'
                          : list[index]['status']),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
