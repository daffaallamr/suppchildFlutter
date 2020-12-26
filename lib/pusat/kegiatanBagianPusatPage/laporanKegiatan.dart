import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

Widget dataLaporan(judul, data) {
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

Widget lokasiFoto(judul, lokasi) {
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
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(0.5),
          Text(
            '$lokasi',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
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

class LaporanKegiatan extends StatelessWidget {
  final List list;
  final int index;
  LaporanKegiatan({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    var namaFoto = list[index]['foto_laporan'];
    Image _image = namaFoto != null
        ? Image.network('http://suppchild.xyz/API/foto_laporan/$namaFoto')
        : null;

    _launchURL() async {
      final namaFile = list[index]['file_laporan'];
      final url = 'http://suppchild.xyz/API/file_laporanKegiatan/$namaFile';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Widget textFoto() {
      return Text('Belum ada foto',
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: colorMainOrange,
          ));
    }

    Widget containerFoto() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Container(
          height: SizeConfig.safeBlockVertical * 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2.0,
              color: colorMainOrange,
            ),
          ),
          child: Center(
            child: _image == null ? textFoto : _image,
          ),
        ),
      );
    }

    Widget buttonUnduh() {
      return Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              _launchURL();
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                'UNDUH FILE LAPORAN',
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

    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Laporan Kegiatan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  spasiBaris(3.0),
                  dataLaporan('Nama Kegiatan:', list[index]['nama']),
                  spasiBaris(2.0),
                  dataLaporan('Daerah Pengaju:', list[index]['pengaju']),
                  spasiBaris(4.0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Foto Kegiatan:',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 6,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: colorMainPurple,
                      ),
                    ),
                  ),
                  containerFoto(),
                  spasiBaris(2.0),
                  lokasiFoto('Lokasi Foto:', list[index]['lokasi']),
                  spasiBaris(6.0),
                  buttonUnduh(),
                  spasiBaris(3.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
