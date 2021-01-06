import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';
import 'package:suppchild_ver_1/loginPageDaerah.dart';

class OpeningPageDaerah extends StatefulWidget {
  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPageDaerah> {
  String username;
  @override
  void initState() {
    super.initState();
    // autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: username != null
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RootDaerah(),
                ))
            : new LoginPageDaerah(),
        image: new Image.asset('assets/image/logo.jpeg'),
        backgroundColor: Colors.white,
        photoSize: 120.0,
        loaderColor: colorMainPurple,
      ),
    );
  }
}
