import 'package:flutter/material.dart';
import 'package:bmnav/bmnav.dart' as bmnav;

//Color
const colorMainPurple = Color(0xFF7B417B);
const colorSecondPurple = Color(0xFFAE73AB);

const colorMainOrange = Color(0xFFC7594A);
const colorSecondOrange = Color(0xFFFE8F57);

//Enter jarak secara vertikal
Widget spasiBaris(tinggi) {
  return SizedBox(
    height: tinggi,
  );
}

// Appbar
Widget appBar () {
  return PreferredSize(
    preferredSize: Size(
          double.infinity, 70
          ),
          child: Container(
            height: 70,
            color: colorMainPurple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                ),
                height: 45,
                width: 270,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    ),
                  ),
              ),
              Icon(
              Icons.message,
              color: Colors.white,
              size: 40,
          ),
        ],
      ),
    ),
  );
}
Widget appBarTitle (title) {
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
Widget navBar () {
  return bmnav.BottomNav(
    color: colorMainPurple,
    iconStyle: bmnav.IconStyle(
      size: 30,
      onSelectSize: 30,
      color: Colors.white,
      onSelectColor: Colors.white,
    ),
    items: [
      bmnav.BottomNavItem(Icons.home),
      bmnav.BottomNavItem(Icons.fitness_center),
      bmnav.BottomNavItem(Icons.person),
      bmnav.BottomNavItem(Icons.access_alarm),
      bmnav.BottomNavItem(Icons.view_headline)
    ],
  );
}

