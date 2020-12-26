import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/loginPage.dart';

class OpeningPage extends StatefulWidget {
  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new LoginPage(),
        image: new Image.asset('assets/image/logo.jpeg'),
        backgroundColor: Colors.white,
        photoSize: 120.0,
        loaderColor: colorMainPurple,
      ),
    );
  }
}
