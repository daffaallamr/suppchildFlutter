import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

//Color
const colorMainPurple = Color(0xFF7B417B);
const colorSecondPurple = Color(0xFFAE73AB);

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
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    centerTitle: true,
    backgroundColor: colorMainPurple,
  );
}

//Navbar
// Widget navBar () {
//   return bmnav.BottomNav(
//     color: colorMainPurple,
//     iconStyle: bmnav.IconStyle(
//       size: 30,
//       onSelectSize: 30,
//       color: Colors.white,
//       onSelectColor: Colors.white,
//     ),
//     items: [
//       bmnav.BottomNavItem(Icons.home),
//       bmnav.BottomNavItem(Icons.event),
//       bmnav.BottomNavItem(Icons.child_care),
//       bmnav.BottomNavItem(Icons.assignment),
//       bmnav.BottomNavItem(Icons.account_circle)
//     ],
//   );
// }
