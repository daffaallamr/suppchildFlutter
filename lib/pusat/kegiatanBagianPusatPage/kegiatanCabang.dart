import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/listSemuaKegiatan.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class KegiatanCabang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonDaerah(kota, daerah) {
      return Center(
        child: Container(
          height: SizeConfig.safeBlockVertical * 7,
          width: SizeConfig.safeBlockHorizontal * 40,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListSemuaKegiatan(
                      daerah: daerah,
                    ),
                  ));
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
                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
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
              width: SizeConfig.safeBlockHorizontal * 90,
              child: Center(
                child: Text(
                  'Data Kegiatan',
                  style: TextStyle(
                    color: colorMainPurple,
                    fontSize: SizeConfig.safeBlockHorizontal * 8,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: SizeConfig.safeBlockVertical * 30,
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
