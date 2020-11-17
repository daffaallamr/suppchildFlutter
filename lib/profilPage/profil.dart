import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget nama(nama) {
  return Text(
    '$nama',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      color: colorMainOrange,
    ),
  );
}
Widget dataNama() {
  return Container(
    height: 100,
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
            'Nama:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          nama('Staff Daerah Lamongan'),
        ],
      ),
    ),
  );
}

Widget username(username) {
  return Text(
    '$username',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      color: colorMainOrange,
    ),
  );
}
Widget dataUsername() {
  return Container(
    height: 100,
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
            'Username:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          nama('daerahlamongan'),
        ],
      ),
    ),
  );
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget buttonUbahPassword() {
      return Center(
        child: Container(
          // width: 160,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ubahPassword');
            },
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              'UBAH PASSWORD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }
    Widget buttonKeluar() {

      Widget buttonbatal() {
        return Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profil');
              },
              padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: colorMainOrange,
              child: Text(
                'BATAL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        );
      }
      Widget buttonYakin() {
        return Center(
          child: Container(
            // width: 160,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profil');
              },
              padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: colorMainPurple,
              child: Text(
                'IYA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        );
      }
      Widget contModal() {
        return AlertDialog(
          content: Container(
            width: double.infinity,
            height: 140,
            child: Column(
              children: <Widget>[
                spasiBaris(15.0),
                Text(
                    'Apakah Anda Ingin Keluar?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                spasiBaris(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonYakin(),
                    buttonbatal(),
                  ],
                ),
              ],
            ),
          ),
        );
      }

      return Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => contModal(),
              );
            },
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainOrange,
            child: Text(
              'KELUAR APLIKASI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
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
    Widget buttonYakin() {
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
              'YAKIN',
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
    Widget contModal() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                  'Apakah Anda Yakin?'
              ),
              buttonYakin(),
              buttonbatal(),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                dataNama(),
                dataUsername(),
                spasiBaris(40.0),
                spasiBaris(20.0),
                buttonUbahPassword(),
                spasiBaris(20.0),
                buttonKeluar(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: navBar(),
      ),
    );
  }
}
