import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget dataLaporan(judul, data) {
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
      padding: const EdgeInsets.fromLTRB(12, 20, 12, 35),
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
Widget lokasiFoto(judul, lokasi) {
  return Container(
    height: 50,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$judul',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          Text(
            '$lokasi',
            style: TextStyle(
              fontSize: 22,
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
  @override
  Widget build(BuildContext context) {

    Widget containerFoto() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Container(
          height: 420,
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
            child: Text( // _image == null?
                'Belum ada foto',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: colorMainOrange,)
            ) //: Image.file(_image),
          ),
        ),
      );
    }
    Widget buttonUnduh() {
      return Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              //Proses
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
                  fontSize: 24,
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
                  dataLaporan('Nama Kegiatan:', 'Agustusan di Desa'),
                  dataLaporan('Daerah Pengaju:', 'Lamongan'),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Foto Kegiatan:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: colorMainPurple,
                      ),
                    ),
                  ),
                  containerFoto(),
                  lokasiFoto('Lokasi Foto:', 'Lamongan Kota'),
                  spasiBaris(40.0),
                  buttonUnduh(),
                  spasiBaris(20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
