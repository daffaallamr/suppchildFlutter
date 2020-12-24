import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: new DecorationImage(
            image: new AssetImage("assets/image/foto1.jpeg"), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          spasiBaris(5.0),
          spasiBaris(5.0),
          Container(
            height: SizeConfig.safeBlockVertical * 6,
            color: colorMainPurple,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
              child: Text(
                'Peringatan Hari Raya Idul Fitri',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: new DecorationImage(
            image: new AssetImage("assets/image/foto2.jpeg"), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          spasiBaris(5.0),
          spasiBaris(5.0),
          Container(
            height: SizeConfig.safeBlockVertical * 6,
            color: colorMainPurple,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
              child: Text(
                'Hari Anak Nasional',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: new DecorationImage(
            image: new AssetImage("assets/image/foto3.jpeg"), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          spasiBaris(5.0),
          spasiBaris(5.0),
          Container(
            height: SizeConfig.safeBlockVertical * 6,
            color: colorMainPurple,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
              child: Text(
                'Bersih Desa Bersama Pak RT',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
