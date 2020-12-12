import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Widget dataKegiatan(judul, data) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$judul',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          Text(
            '$data',
            style: TextStyle(
              fontSize: 24,
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
    var url = "http://10.0.2.2/suppChild_db/pusat/approveKegiatan.php";

    http.post(url, body: {
      "id": list[index]['id'],
      "status": 'diterima',
    });
    print('berhasil!');
  }

  void statusDitolak() {
    var url = "http://10.0.2.2/suppChild_db/pusat/approveKegiatan.php";

    http.post(url, body: {
      "id": list[index]['id'],
      "status": 'ditolak',
    });
    print('berhasil!');
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonTolak() {
      return Center(
        child: Container(
          width: 160,
          child: RaisedButton(
            onPressed: () {
              statusDitolak();
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainOrange,
            child: Text(
              'TOLAK',
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

    Widget buttonTerima() {
      return Center(
        child: Container(
          width: 160,
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
                fontSize: 26,
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
      final url = 'http://10.0.2.2/suppChild_db/file_kegiatan/$namaFile';
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
                fontSize: 26,
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
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Detail Kegiatan',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(50.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.redAccent)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          spasiBaris(20.0),
                          dataKegiatan('Nama Kegiatan:', list[index]['nama']),
                          dataKegiatan(
                              'Daerah Pengaju:', list[index]['pengaju']),
                          spasiBaris(10.0),
                          buttonDownloadFile(),
                          spasiBaris(50.0),
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
