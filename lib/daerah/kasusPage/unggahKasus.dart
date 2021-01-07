import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class UnggahKasus extends StatefulWidget {
  @override
  _UnggahKasusState createState() => _UnggahKasusState();
}

class _UnggahKasusState extends State<UnggahKasus> {
  bool berhasil = true;
  String msg = '';
  String daerahuser;

  // Controller
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerTempat = new TextEditingController();
  TextEditingController controllerDetail = new TextEditingController();

  //RegExp alpha
  RegExp _alpha = RegExp(r'^[a-zA-Z\s]+$');
  RegExp _alphanumeric500 = RegExp(r'^[a-zA-Z0-9]{0,500}');

  @override
  void initState() {
    super.initState();
    _takePrefs();
  }

  _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      daerahuser = prefs.getString('daerahuser');
    });
  }

  /// check if string matches the pattern.
  bool isAlpha(String str) {
    return _alpha.hasMatch(str);
  }

  bool isAlphanumeric500(String str) {
    return _alphanumeric500.hasMatch(str);
  }

  Future addKasus() async {
    var url = "http://suppchild.xyz/API/daerah/addKasus.php";
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String tglUpload = dateFormat.format(DateTime.now());

    if (controllerNama.text.isEmpty) {
      setState(() {
        msg = "Nama Korban Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (isAlpha(controllerNama.text) == false) {
      setState(() {
        msg = "Nama tidak boleh berisi Angka!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerTempat.text.isEmpty) {
      setState(() {
        msg = "Tempat Kejadian Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerDetail.text.isEmpty) {
      setState(() {
        msg = "Detail Singkat Kejadian Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerDetail.text.length > 501) {
      setState(() {
        msg = "Detail maksimal 500 kata!";
        berhasil = false;
        print(msg);
      });
    } else {
      msg = '';
      berhasil = true;
      http.post(url, body: {
        "nama": controllerNama.text,
        "tempat": controllerTempat.text,
        "detail": controllerDetail.text,
        "daerah": daerahuser,
        "tgl_upload": tglUpload,
      });
      print('berhasil!');
    }
  }

  Widget alertGagal() {
    return Center(
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: SizeConfig.safeBlockHorizontal * 4,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget formNama() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: controllerNama,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Nama Korban',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget formTempat() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: controllerTempat,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            border: InputBorder.none,
            hintText: 'Tempat Kejadian',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget formKejadian() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 20,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          maxLines: 5,
          controller: controllerDetail,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 15, 10, 15),
            border: InputBorder.none,
            hintText: 'Deskripsi Singkat',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget buttonUnggah() {
      Widget buttonbatal() {
        return Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.red,
              child: Text(
                'Tidak',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        );
      }

      Widget buttonYakin() {
        return Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                addKasus();
                berhasil == true
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RootDaerah(selectedScreen: 'kasus'),
                        ))
                    : Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: colorMainPurple,
              child: Text(
                'Ya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        );
      }

      Widget contModal() {
        return AlertDialog(
          content: Container(
            height: SizeConfig.safeBlockHorizontal * 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                spasiBaris(1.0),
                Text(
                  'Apakah Anda Yakin?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                spasiBaris(2.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonYakin(),
                    buttonbatal(),
                  ],
                ),
              ],
            ),
          ),
        );
      }

      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => contModal(),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: colorMainPurple,
            child: Text(
              'Laporkan',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonBatal() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Colors.redAccent,
            child: Text(
              'Batal',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Buat Laporan'),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  spasiBaris(2.0),
                  Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage("assets/image/kasus.png"),
                            fit: BoxFit.fill),
                      ),
                      height: SizeConfig.safeBlockVertical * 25,
                      width: SizeConfig.safeBlockHorizontal * 60),
                  // spasiBaris(1.0),
                  Text(
                    'Laporan Kasus',
                    style: TextStyle(
                      color: colorMainPurple,
                      fontSize: SizeConfig.safeBlockHorizontal * 6.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  spasiBaris(3.0),
                  formNama(),
                  spasiBaris(1.0),
                  formTempat(),
                  spasiBaris(1.0),
                  formKejadian(),
                  spasiBaris(1.0),
                  alertGagal(),
                  spasiBaris(4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buttonUnggah(),
                      buttonBatal(),
                    ],
                  ),
                  spasiBaris(1.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
