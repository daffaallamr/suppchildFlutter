import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'listAnakPercabang.dart';

class DataAnakCabang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonDaerah(kota, daerah) {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 40,
        child: Card(
          elevation: 4.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: RaisedButton(
            color: colorSecondPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListAnakPercabang(
                      daerah: daerah,
                    ),
                  ));
            },
            child: Text(
              '$kota',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 4.25,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        spasiBaris(2.0),
        Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/image/anak.png"),
                  fit: BoxFit.fill),
            ),
            height: SizeConfig.safeBlockVertical * 25,
            width: SizeConfig.safeBlockHorizontal * 60),
        // spasiBaris(1.0),
        Text(
          'Anak Binaan',
          style: TextStyle(
            color: colorMainPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 7,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          'Cabang',
          style: TextStyle(
            color: colorMainPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 7,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        spasiBaris(6.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonDaerah('GRESIK', 'Gresik'),
                buttonDaerah('BANGKALAN', 'Bangkalan'),
              ],
            ),
            spasiBaris(2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonDaerah('MOJOKERTO', 'Mojokerto'),
                buttonDaerah('SURABAYA', 'Surabaya'),
              ],
            ),
            spasiBaris(2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonDaerah('SIDOARJO', 'Sidoarjo'),
                buttonDaerah('LAMONGAN', 'Lamongan'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
