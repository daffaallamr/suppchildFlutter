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
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Card(
          elevation: 4.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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

    Widget petunjukData() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 85,
        child: Card(
          color: Colors.grey[100],
          elevation: 4.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Angka kondisi 5:',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorSecondPurple,
                      ),
                    ),
                    spasiBaris(0.5),
                    Text(
                      'Kondisi anak Sangat Baik',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorSecondPurple,
                      ),
                    ),
                  ],
                ),
                spasiBaris(2.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Angka kondisi 4:',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(0.5),
                    Text(
                      'Kondisi anak Baik',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorMainPurple,
                      ),
                    ),
                  ],
                ),
                spasiBaris(2.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Angka kondisi 3:',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorSecondPurple,
                      ),
                    ),
                    spasiBaris(0.5),
                    Text(
                      'Kondisi anak Cukup',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorSecondPurple,
                      ),
                    ),
                  ],
                ),
                spasiBaris(2.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Angka kondisi 2:',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(0.5),
                    Text(
                      'Kondisi anak Kurang',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorMainPurple,
                      ),
                    ),
                  ],
                ),
                spasiBaris(2.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Angka kondisi 1:',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorSecondPurple,
                      ),
                    ),
                    spasiBaris(0.5),
                    Text(
                      'Kondisi anak Sangat Cukup',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorSecondPurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget dataKondisi(kondisi, data) {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.safeBlockHorizontal * 55,
              height: SizeConfig.safeBlockVertical * 8,
              child: Card(
                elevation: 4.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '$kondisi',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorMainPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 20,
              height: SizeConfig.safeBlockVertical * 8,
              child: Card(
                color: colorMainPurple,
                elevation: 4.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '$data',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Kondisi Anak'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                spasiBaris(3.0),
                Text(
                  'Kondisi Anak Binaan',
                  style: TextStyle(
                    color: colorMainPurple,
                    fontSize: SizeConfig.safeBlockHorizontal * 7,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                spasiBaris(3.0),
                dataAnak('Nama Anak:', widget.allList[widget.index]['nama']),
                spasiBaris(4.0),
                dataKondisi(
                    "Kesehatan:", widget.allList[widget.index]['kesehatan']),
                spasiBaris(2.0),
                dataKondisi(
                    "Pendidikan:", widget.allList[widget.index]['pendidikan']),
                spasiBaris(2.0),
                dataKondisi(
                    "Ekonomi:", widget.allList[widget.index]['ekonomi']),
                spasiBaris(5.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Column(
                    children: [
                      Text(
                        'Petunjuk Angka Kondisi',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                          fontWeight: FontWeight.w600,
                          color: colorMainPurple,
                        ),
                      ),
                      spasiBaris(2.0),
                      petunjukData(),
                    ],
                  ),
                ),
                spasiBaris(8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
