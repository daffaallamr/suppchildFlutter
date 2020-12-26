import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class DetailKondisiAnak extends StatefulWidget {
  final List allList;
  final int index;
  DetailKondisiAnak({this.allList, this.index});

  @override
  _DetailKondisiAnakState createState() => _DetailKondisiAnakState();
}

class _DetailKondisiAnakState extends State<DetailKondisiAnak> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget dataAnak(judul, data) {
      return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
              spasiBaris(2.0),
              Text(
                '5 -> Sangat Baik',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainOrange,
                ),
              ),
              spasiBaris(2.0),
              Text(
                '4 -> Baik',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainOrange,
                ),
              ),
              spasiBaris(2.0),
              Text(
                '3 -> Cukup   ',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainOrange,
                ),
              ),
              spasiBaris(2.0),
              Text(
                '2 -> Kurang',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainOrange,
                ),
              ),
              spasiBaris(2.0),
              Text(
                '1 -> Sangat Kurang',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
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
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$kondisi',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
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
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    '$data',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
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

    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Kondisi Anak'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  spasiBaris(3.0),
                  Text(
                    'Informasi Anak Binaan',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                      color: colorMainPurple,
                    ),
                  ),
                  spasiBaris(5.0),
                  petunjukData(),
                  spasiBaris(5.0),
                  dataAnak('Nama Anak:', widget.allList[widget.index]['nama']),
                  spasiBaris(4.0),
                  dataKondisi(
                      "Kesehatan:", widget.allList[widget.index]['kesehatan']),
                  spasiBaris(2.0),
                  dataKondisi("Pendidikan:",
                      widget.allList[widget.index]['pendidikan']),
                  spasiBaris(2.0),
                  dataKondisi(
                      "Ekonomi:", widget.allList[widget.index]['ekonomi']),
                  spasiBaris(8.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
