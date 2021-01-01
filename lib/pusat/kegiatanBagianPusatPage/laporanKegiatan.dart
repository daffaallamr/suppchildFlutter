import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

Widget dataLaporan(judul, data) {
  return Container(
    width: SizeConfig.safeBlockHorizontal * 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Card(
      elevation: 4.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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

class LaporanKegiatan extends StatefulWidget {
  final List list;
  final int index;
  LaporanKegiatan({this.list, this.index});

  @override
  _LaporanKegiatanState createState() => _LaporanKegiatanState();
}

class _LaporanKegiatanState extends State<LaporanKegiatan> {
  bool adaFoto = true;
  String namaFoto;
  String statusLokasiFoto = '-';
  bool fileAda = true;
  String msg = '';

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

  _checkFileLaporan() async {
    String namaFileAda = widget.list[widget.index]['file_laporan'];
    if (namaFileAda == null) {
      setState(() {
        msg = "File Laporan Belum Ada!";
        fileAda = false;
        print(msg);
      });
    } else {
      msg = "";
      fileAda = true;
      print('berhasil download!');
    }
  }

  _ambilNamaFoto() async {
    String namaFotoDB = widget.list[widget.index]['foto_laporan'];
    String adaLokasiFoto = widget.list[widget.index]['lokasi'];
    if (namaFotoDB == null) {
      adaFoto = false;
    } else if (namaFotoDB != null) {
      namaFoto = namaFotoDB;
      statusLokasiFoto = adaLokasiFoto;
    }
  }

  Widget lokasiFoto(judul) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      height: SizeConfig.safeBlockVertical * 14,
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
                '$statusLokasiFoto',
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

  @override
  void initState() {
    _ambilNamaFoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      final namaFile = widget.list[widget.index]['file_laporan'];
      final url = 'http://suppchild.xyz/API/file_laporanKegiatan/$namaFile';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Widget textFoto() {
      return Center(
        child: Text(
          'Belum ada Foto',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      );
    }

    Widget containerFoto() {
      return adaFoto == true
          ? Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: new DecorationImage(
                    image: NetworkImage(
                        'http://suppchild.xyz/API/foto_laporan/$namaFoto'),
                    fit: BoxFit.fill),
              ),
            )
          : textFoto();
    }

    Widget buttonUnduh() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 6.5,
        child: RaisedButton(
          onPressed: () {
            _checkFileLaporan();
            if (fileAda == false) {
            } else {
              _launchURL();
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: colorMainPurple,
          child: Text(
            'Unduh File Laporan',
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
        appBar: appBarTitle('Laporan Kegiatan'),
        body: SingleChildScrollView(
          child: Center(
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
                  'Laporan Kegiatan',
                  style: TextStyle(
                    color: colorMainPurple,
                    fontSize: SizeConfig.safeBlockHorizontal * 7,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                spasiBaris(3.0),
                dataLaporan(
                    'Nama Kegiatan:', widget.list[widget.index]['nama']),
                dataLaporan(
                    'Daerah Pengaju:', widget.list[widget.index]['pengaju']),
                spasiBaris(8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Foto Kegiatan',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                        fontWeight: FontWeight.w600,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(1.5),
                    Container(
                      height: SizeConfig.safeBlockVertical * 65,
                      width: SizeConfig.safeBlockHorizontal * 80,
                      child: Card(
                          color: Colors.grey[100],
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: containerFoto()),
                    ),
                  ],
                ),
                spasiBaris(2.0),
                lokasiFoto('Lokasi Foto:'),
                spasiBaris(2.0),
                alertGagal(),
                spasiBaris(6.0),
                buttonUnduh(),
                spasiBaris(4.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
