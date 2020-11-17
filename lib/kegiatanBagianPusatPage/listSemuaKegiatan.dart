import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

Widget titleList(title) {
  return Container(
    color: colorMainPurple,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Text(
          '$title',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    ),
  );
}

class ListSemuaKegiatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget listKegiatanDiajukan(pengajuan) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: colorMainPurple,
              width: 3,
            ),
            right: BorderSide(
              color: colorMainPurple,
              width: 3,
            ),
            bottom: BorderSide(
              color: colorMainPurple,
              width: 3,
            ),
          ),
        ),
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '1. $pengajuan',
                style: TextStyle(

                  color: colorMainPurple,
                  fontSize: 22,
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
        appBar: appBarTitle('Daftar Kegiatan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: <Widget>[
                    titleList('Yang Diajukan'),
                    listKegiatanDiajukan('Hari Raya Tumpengan'),
                    listKegiatanDiajukan('Hari Kesaktian Pancasila'),
                    listKegiatanDiajukan('Bersih Desa'),
                    spasiBaris(40.0),
                    titleList('Yang Diterima'),
                    listKegiatanDiajukan('Hari Raya Makmur'),
                    listKegiatanDiajukan('17 Agustusan'),
                    listKegiatanDiajukan('Nyepi'),
                    listKegiatanDiajukan('Salam Satu'),
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
