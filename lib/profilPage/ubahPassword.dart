import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget formPasswordSekarang() {
  return Container(
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
          width: 2.0,
          color: Color(0xFF7B417B)),
    ),
    child: TextFormField(
      autofocus: false,
      cursorColor: colorMainPurple,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 22,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
        border: InputBorder.none,
      ),
    ),
  );
}
Widget contPasswordSekarang() {
  return Container(
    // height: 100,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password Sekarang:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(8.0),
          formPasswordSekarang(),
        ],
      ),
    ),
  );
}

Widget formPasswordBaru() {
  return Container(
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
          width: 2.0,
          color: Color(0xFF7B417B)),
    ),
    child: TextFormField(
      autofocus: false,
      cursorColor: colorMainPurple,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 22,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
        border: InputBorder.none,
      ),
    ),
  );
}
Widget contPasswordBaru() {
  return Container(
    // height: 100,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password Baru:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(8.0),
          formPasswordBaru(),
        ],
      ),
    ),
  );
}

Widget formKonfirmasiPassword() {
  return Container(
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
          width: 2.0,
          color: Color(0xFF7B417B)),
    ),
    child: TextFormField(
      autofocus: false,
      cursorColor: colorMainPurple,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 22,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
        border: InputBorder.none,
      ),
    ),
  );
}
Widget contKonfirmasiPassword() {
  return Container(
    // height: 100,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Konfirmasi Password Baru:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(8.0),
          formKonfirmasiPassword(),
        ],
      ),
    ),
  );
}

class UbahPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget buttonUbah() {
      return Center(
        child: Container(
          // width: 160,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              'UBAH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }
    Widget buttonbatal() {
      return Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainOrange,
            child: Text(
              'BATAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Ubah Password'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                contPasswordSekarang(),
                spasiBaris(20.0),
                contPasswordBaru(),
                spasiBaris(20.0),
                contKonfirmasiPassword(),
                spasiBaris(60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonUbah(),
                    buttonbatal(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
