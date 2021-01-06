import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

//Color
const colorMainPurple = Color(0xFF8366B3);
const colorSecondPurple = Color(0xFFAA7FC6);

const colorMainOrange = Color(0xFFC7594A);
const colorSecondOrange = Color(0xFFFE8F57);

const colorGrey = Color(0xFFf5f5f5);
const colorOrange = Color(0xFF64b5f6);

const colorChart_1 = Color(0xFF003f5c);
const colorChart_2 = Color(0xFF444e86);
const colorChart_3 = Color(0xFF955196);
const colorChart_4 = Color(0xFFdd5182);
const colorChart_5 = Color(0xFFff6e54);
const colorChart_6 = Color(0xFFffa600);

//Enter jarak secara vertikal
Widget spasiBaris(tinggi) {
  return SizedBox(
    height: SizeConfig.safeBlockVertical * tinggi,
  );
}

Widget appBarTitle(title) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(
        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    centerTitle: true,
    backgroundColor: colorMainPurple,
  );
}
