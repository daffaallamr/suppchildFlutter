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
        msg = "Password sekarang anda salah!";
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget formPasswordSekarang() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: TextField(
          controller: controllerCurrentPass,
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
                'PASSWORD SEKARANG',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
              spasiBaris(2.0),
              formPasswordSekarang(),
            ],
          ),
        ),
      );
    }

    Widget formPasswordBaru() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: TextField(
          controller: controllerNewPass,
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
                'PASSWORD BARU',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
              spasiBaris(2.0),
              formPasswordBaru(),
            ],
          ),
        ),
      );
    }

    Widget formKonfirmasiPassword() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: TextField(
          controller: controllerConfirmPass,
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
                'KONFIRMASI PASSWORD BARU',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
              spasiBaris(2.0),
              formKonfirmasiPassword(),
            ],
          ),
        ),
      );
    }

    Widget buttonUbah() {
      return Center(
        child: Container(
          // width: 160,
          child: RaisedButton(
            onPressed: () {
              _ubahPass();
              berhasil == true ? Navigator.pop(context) : Text('');
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
              Navigator.pop(context);
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  contPasswordSekarang(),
                  spasiBaris(1.0),
                  contPasswordBaru(),
                  spasiBaris(1.0),
                  contKonfirmasiPassword(),
                  spasiBaris(1.0),
                  alertGagal(),
                  spasiBaris(2.0),
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
      ),
    );
  }
}
