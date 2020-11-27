import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/pusat/rootPusat.dart';
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';

import 'package:suppchild_ver_1/homePage/homeScreen.dart';
import 'package:suppchild_ver_1/loginPage.dart';
import 'package:suppchild_ver_1/searchPage.dart';

import 'package:suppchild_ver_1/chatPage/listChat.dart';

import 'package:suppchild_ver_1/daerah/dataAnakPage/listAnak.dart';
import 'package:suppchild_ver_1/daerah/dataAnakPage/tambahAnak.dart';
import 'package:suppchild_ver_1/daerah/dataAnakPage/ubahDataAnak.dart';

import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/dataAnakCabang.dart';
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/listAnakPercabang.dart';
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/detailKondisiAnak.dart';

import 'package:suppchild_ver_1/daerah/kasusPage/listKasus.dart';
import 'package:suppchild_ver_1/daerah/kasusPage/unggahKasus.dart';
import 'package:suppchild_ver_1/daerah/kasusPage/statusKasus.dart';

import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/kasusCabang.dart';
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/listKasusPercabang.dart';
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/pemilihanStatusKasus.dart';

import 'package:suppchild_ver_1/daerah/kegiatanPage/listKegiatan.dart';
import 'package:suppchild_ver_1/daerah/kegiatanPage/buatKegiatan.dart';
import 'package:suppchild_ver_1/daerah/kegiatanPage/uploadLaporanKegiatan.dart';

import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/kegiatanCabang.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/listSemuaKegiatan.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/approveKegiatan.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/laporanKegiatan.dart';

import 'package:suppchild_ver_1/profilPage/profil.dart';
import 'package:suppchild_ver_1/profilPage/ubahPassword.dart';

import 'package:suppchild_ver_1/profilPage/cobaRadio.dart';

void main() => runApp(MyApp());

String username = '';
String nama = '';
String daerahuser = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SuppChild',
      theme: ThemeData(
      ),
      initialRoute: '/login',

      routes: <String, WidgetBuilder>{
        '/rootPusat': (BuildContext context) => RootPusat(username: username, nama: nama,),
        '/rootDaerah': (BuildContext context) => RootDaerah(),

        //Profil
        '/profil': (context) => ProfilePage(),
        '/ubahPassword': (context) => UbahPassword(),

        '/': (context) => HomeScreen(),
        '/login': (context) => LoginPage(),
        '/search': (context) => SearchPage(),

        //Pesan
        '/listChat': (context) => ListChat(),

        //Data Anak bagian cabang
        '/listAnak': (context) => ListAnak(),
        '/tambahAnak': (context) => TambahAnak(),
        '/ubahDataAnak': (context) => UbahDataAnak(),

        //Data Anak bagian pusat
        '/dataAnakCabang': (context) => DataAnakCabang(),
        '/listAnakPercabang': (context) => ListAnakPercabang(), //List Anak percabang
        '/detailKondisiAnak': (context) => DetaiKondisiAnak(), //List Anak percabang

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

        '/coba': (context) => GroupedButton(),
      },
    );
  }
}








