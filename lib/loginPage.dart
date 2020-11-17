import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget buildUsername() {
  return Container(
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 2.5,
          color: Color(0xFF7B417B)),
    ),
    child: TextFormField(
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
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
          width: 2.5,
          color: Color(0xFF7B417B)),
    ),
    child: TextFormField(
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buttonMasuk() {
      return Center(
        child: Container(
          width: 120,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
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
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    final size = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: size.size.width / 1.1,
            height: size.size.height / 1,
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
                    height: 30,
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
                            fontSize: 25,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        buildUsername(),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'PASSWORD',
                          style: TextStyle(
                            color: colorMainPurple,
                            letterSpacing: 0.6,
                            fontSize: 25,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        buildPassword(),
                        SizedBox(
                          height: 30,
                        ),
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
