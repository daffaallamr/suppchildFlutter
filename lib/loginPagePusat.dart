import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';
import 'package:suppchild_ver_1/pusat/rootPusat.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class LoginPagePusat extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPagePusat> {
  //Controller
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  //Mesaage gagal login
  String msg = '';
  int idLogin;
  bool isLoggedIn = false;

  //Method login
  Future<List> _login() async {
    final response =
        await http.post("http://suppchild.xyz/API/loginPusat.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Username atau Password anda salah!";
      });
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('id_staffpusat', int.parse(datauser[0]['id_staffpusat']));
      prefs.setString('username', datauser[0]['username']);
      prefs.setString('password', datauser[0]['password']);
      prefs.setString('nama_staffpusat', datauser[0]['nama_staffpusat']);

      print(prefs.getInt('id_staffpusat'));
      print(prefs.getString('username'));
      print(prefs.getString('password'));
      print(prefs.getString('nama_staffpusat'));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RootPusat(),
          ));
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonMasuk() {
      return Center(
        child: Container(
          height: SizeConfig.safeBlockVertical * 8,
          width: SizeConfig.safeBlockHorizontal * 100,
          child: RaisedButton(
            onPressed: () {
              _login();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            color: colorMainPurple,
            child: Text(
              'MASUK',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 6.25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      );
    }

    Widget buildUsername() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8.5,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: user,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Icon(
                Icons.person,
                color: colorMainPurple,
                size: SizeConfig.safeBlockVertical * 4.5,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Username',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget buildPassword() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8.5,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: pass,
          autofocus: false,
          obscureText: true,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Icon(
                Icons.vpn_key,
                color: colorMainPurple,
                size: SizeConfig.safeBlockVertical * 4.5,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget alertGagal() {
      return Center(
        child: Text(
          msg,
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: SizeConfig.safeBlockHorizontal * 3.75,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      );
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 88,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: <Widget>[
                      spasiBaris(1.0),
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/image/logo.jpeg'),
                          radius: SizeConfig.safeBlockHorizontal * 27.5,
                        ),
                      ),
                      spasiBaris(4.0),
                      Text(
                        'SuppChild Pusat',
                        style: TextStyle(
                          color: colorMainPurple,
                          letterSpacing: 0.3,
                          fontSize: SizeConfig.safeBlockHorizontal * 9,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      spasiBaris(0.5),
                      Text(
                        'Masuk untuk Melanjutkan',
                        style: TextStyle(
                          color: colorSecondPurple,
                          fontSize: SizeConfig.safeBlockHorizontal * 4.25,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      spasiBaris(10.0),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.redAccent)
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            buildUsername(),
                            spasiBaris(2.0),
                            buildPassword(),
                            spasiBaris(3.0),
                            alertGagal(),
                            spasiBaris(5.0),
                            buttonMasuk(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
