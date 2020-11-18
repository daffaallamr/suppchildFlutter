import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget titleList(title) {
  return Container(
    color: colorMainPurple,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Text(
          '$title',
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

class ListAnakPercabang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget listAnak(anak) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: colorMainPurple,
              width: 3,
            ),
            right: BorderSide(
              color: colorMainPurple,
              width: 3,
            ),
            bottom: BorderSide(
              color: colorMainPurple,
              width: 3,
            ),
          ),
        ),
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detailKondisiAnak');
          },
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '1. $anak',
                style: TextStyle(

                  color: colorMainPurple,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Daftar Anak Binaan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: <Widget>[
                    titleList('Lamongan'),
                    listAnak('Ananda Rifqi'),
                    listAnak('Hilmi Syahputra'),
                    listAnak('Ilham Fikri'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
