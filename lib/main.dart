import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/homePage/homeScreen.dart';
import 'package:suppchild_ver_1/loginPage.dart';
import 'package:suppchild_ver_1/searchPage.dart';

import 'package:suppchild_ver_1/dataAnakPage/listAnak.dart';
import 'package:suppchild_ver_1/dataAnakPage/tambahAnak.dart';

import 'package:suppchild_ver_1/kasusPage/listKasus.dart';
import 'package:suppchild_ver_1/kasusPage/unggahKasus.dart';
import 'package:suppchild_ver_1/kasusPage/statusKasus.dart';

import 'package:suppchild_ver_1/kasusBagianPusatPage/kasusCabang.dart';
import 'package:suppchild_ver_1/kasusBagianPusatPage/listKasusPercabang.dart';
import 'package:suppchild_ver_1/kasusBagianPusatPage/pemilihanStatusKasus.dart';

import 'package:suppchild_ver_1/kegiatanPage/listKegiatan.dart';
import 'package:suppchild_ver_1/kegiatanPage/buatKegiatan.dart';
import 'package:suppchild_ver_1/kegiatanPage/uploadLaporanKegiatan.dart';

import 'package:suppchild_ver_1/kegiatanBagianPusatPage/kegiatanCabang.dart';
import 'package:suppchild_ver_1/kegiatanBagianPusatPage/listSemuaKegiatan.dart';
import 'package:suppchild_ver_1/kegiatanBagianPusatPage/approveKegiatan.dart';
import 'package:suppchild_ver_1/kegiatanBagianPusatPage/laporanKegiatan.dart';

import 'package:suppchild_ver_1/profilPage/profil.dart';
import 'package:suppchild_ver_1/profilPage/ubahPassword.dart';

import 'package:suppchild_ver_1/profilPage/cobaRadio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SuppChild',
      theme: ThemeData(
      ),
      initialRoute: '/ubahPassword',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginPage(),
        '/search': (context) => SearchPage(),

        '/listAnak': (context) => ListAnak(),
        '/tambahAnak': (context) => TambahAnak(),

        //Kasus bagian cabang
        '/listKasus': (context) => ListKasus(),
        '/unggahKasus': (context) => UnggahKasus(),
        '/statusKasus': (context) => StatusKasus(),

        //Kasus Bagian Pusat
        '/kasusCabang': (context) => KasusCabang(), //Daftar Cabang
        '/listKasusPercabang': (context) => ListKasusPercabang(), //List Kasus percabang
        '/pemilihanStatusKasus': (context) => PemilihanStatusKasus(), //Mengatur status kasus yang ada

        //Kegiatan Bagian cabang
        '/listKegiatan': (context) => ListKegiatan(),
        '/buatKegiatan': (context) => BuatKegiatan(),
        '/uploadLaporanKegiatan': (context) => UploadKegiatan(),

        //Kegiatan Bagian pusat
        '/kegiatanCabang': (context) => KegiatanCabang(), //Daftar Cabang
        '/listSemuaKegiatan': (context) => ListSemuaKegiatan(), //List semua kegiatan acc atau belum
        '/approveKegiatan': (context) => ApproveKegiatan(), //Approve pengajuan kegiatan
        '/laporanKegiatan': (context) => LaporanKegiatan(), //Melihat hasil(laporan) kegiatan yang sudah di approve

        //Profil
        '/profil': (context) => ProfilePage(),
        '/ubahPassword': (context) => UbahPassword(),

        '/coba': (context) => GroupedButton(),
      },
    );
  }
}







