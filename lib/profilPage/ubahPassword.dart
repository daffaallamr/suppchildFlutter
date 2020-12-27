import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class UbahPassword extends StatefulWidget {
  @override
  _UbahPasswordState createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  //Mesaage gagal login
  String msg = '';
  bool berhasil = true;

  //Controller
  TextEditingController controllerCurrentPass = new TextEditingController();
  TextEditingController controllerNewPass = new TextEditingController();
  TextEditingController controllerConfirmPass = new TextEditingController();

  Future _ubahPass() async {
    var url = "http://suppchild.xyz/API/ubahPassword.php";

    if (controllerCurrentPass.text != passwordUser) {
      setState(() {
        msg = "Password lama anda salah!";
        berhasil = false;
        print('pass salah!');
      });
    } else if (controllerNewPass.text != controllerConfirmPass.text) {
      setState(() {
        msg = "Konfirmasi password anda salah!";
        berhasil = false;
        print('konfirm pass salah!');
      });
    } else {
      berhasil = true;
      print('Berhasil');
      http.post(url, body: {
        "id": idUser,
        "password": controllerConfirmPass.text,
      });
    }
  }

  Widget alertGagal() {
    return Center(
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: SizeConfig.safeBlockHorizontal * 4,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget formPasswordSekarang() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: controllerCurrentPass,
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
                color: colorSecondPurple,
                size: SizeConfig.safeBlockVertical * 4.5,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Password Lama',
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

    Widget formPasswordBaru() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: controllerNewPass,
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
                color: colorSecondPurple,
                size: SizeConfig.safeBlockVertical * 4.5,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Password Baru',
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

    Widget formKonfirmasiPassword() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: controllerConfirmPass,
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
                color: colorSecondPurple,
                size: SizeConfig.safeBlockVertical * 4.5,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Konfirmasi Password',
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

    Widget buttonUbah() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 80,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              _ubahPass();
              berhasil == true ? Navigator.pop(context) : Text('');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: colorMainPurple,
            child: Text(
              'Ubah',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonbatal() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 80,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Colors.redAccent,
            child: Text(
              'Batal',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Ubah Password'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                spasiBaris(2.0),
                Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          image:
                              new AssetImage("assets/image/ubahPassword.png"),
                          fit: BoxFit.fill),
                    ),
                    height: SizeConfig.safeBlockVertical * 25,
                    width: SizeConfig.safeBlockHorizontal * 60),
                spasiBaris(4.0),
                formPasswordSekarang(),
                spasiBaris(1.5),
                formPasswordBaru(),
                spasiBaris(1.5),
                formKonfirmasiPassword(),
                spasiBaris(2.0),
                alertGagal(),
                spasiBaris(9.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonUbah(),
                    spasiBaris(1.0),
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
