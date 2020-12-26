import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/pusat/rootPusat.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controller
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  //Mesaage gagal login
  String msg = '';

  //Method login
  Future<List> _login() async {
    final response =
        await http.post("http://suppchild.xyz/API/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Username atau Password anda salah!";
      });
    } else {
      if (datauser[0]['level'] == 'pusat') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RootPusat(
                idPassing: int.parse(datauser[0]['id']),
              ),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RootDaerah(
                idPassing: int.parse(datauser[0]['id']),
              ),
            ));
      }
      setState(() {
        username = datauser[0]['username'];
        nama = datauser[0]['nama'];
        daerahuser = datauser[0]['daerahuser'];
        passwordUser = datauser[0]['password'];
        idUser = int.parse(datauser[0]['id']);
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonMasuk() {
      return Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              _login();
            },
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.5),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
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
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 1.5),
          border: Border.all(width: 1.75, color: Color(0xFF7B417B)),
        ),
        child: TextFormField(
          controller: user,
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

    Widget buildPassword() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 1.5),
          border: Border.all(width: 1.75, color: Color(0xFF7B417B)),
        ),
        child: TextFormField(
          controller: pass,
          autofocus: false,
          obscureText: true,
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

    Widget alertGagal() {
      return Text(
        msg,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: SizeConfig.safeBlockHorizontal * 4,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      );
    }

    final size = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 88,
            // decoration: BoxDecoration(
            //     // border: Border.all(color: colorMainPurple),
            // ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: <Widget>[
                  spasiBaris(4.0),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/image/logo.jpeg'),
                    radius: 130,
                  ),
                  spasiBaris(4.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.redAccent)
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'USERNAME',
                          style: TextStyle(
                            color: colorMainPurple,
                            letterSpacing: 0.3,
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        spasiBaris(1.0),
                        buildUsername(),
                        spasiBaris(3.0),
                        Text(
                          'PASSWORD',
                          style: TextStyle(
                            color: colorMainPurple,
                            letterSpacing: 0.3,
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        spasiBaris(1.0),
                        buildPassword(),
                        spasiBaris(2.0),
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
    );
  }
}
