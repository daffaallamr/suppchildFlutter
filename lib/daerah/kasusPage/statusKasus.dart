import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

Widget dataKasus(judul, data) {
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
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$judul:',
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

class StatusKasus extends StatelessWidget {
  final List list;
  final int index;
  StatusKasus({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Status Laporan'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                spasiBaris(2.0),
                Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("assets/image/kasus.png"),
                          fit: BoxFit.fill),
                    ),
                    height: SizeConfig.safeBlockVertical * 25,
                    width: SizeConfig.safeBlockHorizontal * 60),
                // spasiBaris(1.0),
                Text(
                  'Detail Kasus',
                  style: TextStyle(
                    color: colorMainPurple,
                    fontSize: SizeConfig.safeBlockHorizontal * 6.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                spasiBaris(2.0),
                dataKasus('Nama Anak', list[index]['nama']),
                dataKasus('Tempat Kasus', list[index]['tempat']),
                dataKasus('Detail Kasus', list[index]['detail']),
                dataKasus(
                    'Status',
                    list[index]['status'] == null
                        ? 'Belum ada status'
                        : list[index]['status']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
