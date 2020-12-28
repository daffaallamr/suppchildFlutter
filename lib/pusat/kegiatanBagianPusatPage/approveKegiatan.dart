import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/rootPusat.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Widget dataKegiatan(judul, data) {
  return Container(
    width: SizeConfig.safeBlockHorizontal * 80,
    height: SizeConfig.safeBlockVertical * 10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Card(
      elevation: 4.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$judul',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: colorMainPurple,
              ),
            ),
            spasiBaris(0.5),
            Text(
              '$data',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: colorSecondPurple,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ApproveKegiatan extends StatelessWidget {
  final List list;
  final int index;
  ApproveKegiatan({this.list, this.index});

  void statusDiterima() {
    var url = "http://suppchild.xyz/API/pusat/approveKegiatan.php";

    http.post(url, body: {
      "id": list[index]['id'],
      "status": 'diterima',
    });
    print('berhasil!');
  }

  void statusDitolak() {
    var url = "http://suppchild.xyz/API/pusat/approveKegiatan.php";

    http.post(url, body: {
      "id": list[index]['id'],
      "status": 'ditolak',
    });
    print('berhasil!');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonTolak() {
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
            // width: 160,
            child: RaisedButton(
              onPressed: () {
                statusDitolak();
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
                  'Apakah Anda Yakin Menolak Kegiatan Ini?',
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

      return Container(
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
          color: Colors.redAccent,
          child: Text(
            'Tolak',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 5.75,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    }

    Widget buttonTerima() {
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
                statusDiterima();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RootPusat(selectedScreen: 'kegiatan'),
                    ));
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
                  'Apakah Anda Yakin Menerima Kegiatan Ini?',
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

      return Container(
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
            'Terima',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 5.75,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    }

    _launchURL() async {
      final namaFile = list[index]['file_ajuan'];
      final url = 'http://suppchild.xyz/API/file_kegiatan/$namaFile';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Widget buttonDownloadFile() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 6.5,
        child: RaisedButton(
          onPressed: () {
            _launchURL();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: colorSecondPurple,
          child: Text(
            'Unduh File',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 5.75,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Kegiatan Diajukan'),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  spasiBaris(2.0),
                  Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage(
                                "assets/image/approveKegiatan.png"),
                            fit: BoxFit.fill),
                      ),
                      height: SizeConfig.safeBlockVertical * 25,
                      width: SizeConfig.safeBlockHorizontal * 60),
                  spasiBaris(2.0),
                  Text(
                    'Data Kegiatan',
                    style: TextStyle(
                      color: colorMainPurple,
                      fontSize: SizeConfig.safeBlockHorizontal * 7,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  spasiBaris(5.0),
                  dataKegiatan('Nama Kegiatan:', list[index]['nama']),
                  dataKegiatan('Daerah Pengaju:', list[index]['pengaju']),
                  spasiBaris(1.0),
                  buttonDownloadFile(),
                  spasiBaris(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buttonTolak(),
                      buttonTerima(),
                    ],
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
