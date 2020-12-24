import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.username, this.nama});

  final String username;
  final String nama;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget dataNama() {
      return Container(
        height: SizeConfig.safeBlockVertical * 14,
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
                'NAMA:',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 7,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
              spasiBaris(2.0),
              Text(
                '$nama',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 7,
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

    Widget dataUsername() {
      return Container(
        height: SizeConfig.safeBlockVertical * 14,
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
                'USERNAME:',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 7,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
              spasiBaris(2.0),
              Text(
                '$username',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 7,
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
                fontSize: SizeConfig.safeBlockHorizontal * 7,
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
        return WillPopScope(
          child: Center(
            child: Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
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
                    fontSize: SizeConfig.safeBlockHorizontal * 7,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
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
                Navigator.pushReplacementNamed(context, '/login');
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
                  fontSize: SizeConfig.safeBlockHorizontal * 7,
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
            height: SizeConfig.safeBlockHorizontal * 35,
            child: Column(
              children: <Widget>[
                spasiBaris(1.0),
                Text(
                  'APAKAH ANDA YAKIN AKAN KELUAR?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: SizeConfig.safeBlockHorizontal * 6,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                spasiBaris(3.0),
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
                fontSize: SizeConfig.safeBlockHorizontal * 7,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: <Widget>[
            dataNama(),
            dataUsername(),
            spasiBaris(5.0),
            spasiBaris(23.0),
            buttonUbahPassword(),
            spasiBaris(1.0),
            buttonKeluar(),
          ],
        ),
      ),
    );
  }
}
