import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

//Color
const colorMainPurple = Color(0xFF8366B3);
const colorSecondPurple = Color(0xFFAA7FC6);

const colorMainOrange = Color(0xFFC7594A);
const colorSecondOrange = Color(0xFFFE8F57);

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
