import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'listAnakPercabang.dart';

class DataAnakCabang extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget buttonDaerah(kota, daerah) {
      return Center(
        child: Container(
          width: 170,
          height: 55,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListAnakPercabang(daerah: daerah),
                  )
              );
            },
            padding: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainOrange,
            child: Text(
              '$kota',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 50),
            child: Center(
              child: Container(
                width: 380,
                child: Center(
                  child: Text(
                    'Data Anak Binaan',
                    style: TextStyle(
                      color: colorMainPurple,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonDaerah('GRESIK', 'Gresik'),
                    buttonDaerah('BANGKALAN', 'Bangkalan'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonDaerah('MOJOKERTO', 'Mojokerto'),
                    buttonDaerah('SURABAYA', 'Surabaya'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonDaerah('SIDOARJO', 'Sidoarjo'),
                    buttonDaerah('LAMONGAN', 'Lamongan'),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  }
}