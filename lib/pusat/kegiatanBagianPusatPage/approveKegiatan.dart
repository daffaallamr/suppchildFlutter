import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Widget dataKegiatan(judul, data) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$judul',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(0.5),
          Text(
            '$data',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
        ],
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
      return Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              statusDitolak();
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainOrange,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                'TOLAK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonTerima() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          child: RaisedButton(
            onPressed: () {
              statusDiterima();
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              'TERIMA',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 6,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
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
      return Center(
        child: Container(
          width: double.infinity,
          child: RaisedButton(
            onPressed: () {
              _launchURL();
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              'FILE',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 7,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }

    final size = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Info Kegiatan'),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: size.size.width / 1.1,
              // decoration: BoxDecoration(
              //     // border: Border.all(color: colorMainPurple),
              // ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: <Widget>[
                    spasiBaris(5.0),
                    Text(
                      'Detail Kegiatan',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 7.5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(6.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.redAccent)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          spasiBaris(6.0),
                          dataKegiatan('Nama Kegiatan:', list[index]['nama']),
                          spasiBaris(4.0),
                          dataKegiatan(
                              'Daerah Pengaju:', list[index]['pengaju']),
                          spasiBaris(22.0),
                          buttonDownloadFile(),
                          spasiBaris(6.0),
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
