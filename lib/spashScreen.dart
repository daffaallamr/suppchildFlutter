import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';
import 'package:suppchild_ver_1/loginPage.dart';
import 'package:suppchild_ver_1/pusat/rootPusat.dart';

class OpeningPage extends StatefulWidget {
  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  bool pusat = false;
  bool daerah = false;
  String userLevel;
  String namaUser;
  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userLevel = prefs.getString('userLevel');
      namaUser = prefs.getString('username');
    });

    if (userLevel == null) {
      return;
    } else if (userLevel == 'pusat') {
      setState(() {
        pusat = true;
      });
    } else if (userLevel == 'daerah') {
      setState(() {
        daerah = true;
      });
    }
    print(userLevel);
    print(namaUser);
  }

  @override
  Widget build(BuildContext context) {
    toPusat() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RootPusat(
              idPassing: prefs.getInt('idUser'),
            ),
          ));
    }

    toDaerah() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RootDaerah(
              idPassing: prefs.getInt('idUser'),
            ),
          ));
    }

    return SafeArea(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: pusat == true
            ? toPusat()
            : daerah == true
                ? toDaerah()
                : new LoginPage(),
        image: new Image.asset('assets/image/logo.jpeg'),
        backgroundColor: Colors.white,
        photoSize: 120.0,
        loaderColor: colorMainPurple,
      ),
    );
  }
}
