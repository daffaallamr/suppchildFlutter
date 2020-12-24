import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/main.dart';
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
        Navigator.pushReplacementNamed(context, '/rootPusat');
      } else {
        Navigator.pushReplacementNamed(context, '/rootDaerah');
      }
      setState(() {
        username = datauser[0]['username'];
        nama = datauser[0]['nama'];
        daerahuser = datauser[0]['daerahuser'];
        passwordUser = datauser[0]['password'];
        idUser = datauser[0]['id'];
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
          height: SizeConfig.safeBlockVertical * 7,
          child: RaisedButton(
            onPressed: () {
              _login();
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            color: colorMainPurple,
            child: Text(
              'MASUK',
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

    Widget buildUsername() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2.5, color: Color(0xFF7B417B)),
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
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2.5, color: Color(0xFF7B417B)),
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
          fontSize: 16,
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
            width: size.size.width / 1.1,
            // decoration: BoxDecoration(
            //     // border: Border.all(color: colorMainPurple),
            // ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/image/logo.jpeg'),
                    radius: 130,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.size.height / 2,
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
                            letterSpacing: 0.6,
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        spasiBaris(2.0),
                        buildUsername(),
                        spasiBaris(2.0),
                        Text(
                          'PASSWORD',
                          style: TextStyle(
                            color: colorMainPurple,
                            letterSpacing: 0.6,
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        spasiBaris(2.0),
                        buildPassword(),
                        spasiBaris(2.0),
                        alertGagal(),
                        spasiBaris(2.0),
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
