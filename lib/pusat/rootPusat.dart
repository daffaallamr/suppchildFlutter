import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/homePagePusat/homeScreen.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/my_flutter_app_icons.dart';
import 'package:suppchild_ver_1/profilPagePusat/profil.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/dataAnakCabang.dart';
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/kasusCabang.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/kegiatanCabang.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'package:suppchild_ver_1/searchPagePusat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootPusat extends StatefulWidget {
  final String selectedScreen;
  final Future<List> dataAnakSearch;
  RootPusat({this.selectedScreen, this.dataAnakSearch});

  @override
  _RootPageState createState() =>
      _RootPageState(selectedScreen: selectedScreen);
}

class _RootPageState extends State<RootPusat> {
  TextEditingController controllerSearch = new TextEditingController();
  int idStaffPusat;
  String namaStaffPusat;

  final String selectedScreen;
  _RootPageState({this.selectedScreen});

  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    KegiatanCabang(),
    DataAnakCabang(),
    KasusCabang(),
    ProfilePagePusat()
  ];

  Widget currentScreen;
  @override
  void initState() {
    super.initState();
    currentScreen = new SelectedScreen(selectedScreen: selectedScreen);
    _takePrefs();
  }

  _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idStaffPusat = prefs.getInt('id_staffpusat');
      namaStaffPusat = prefs.getString('nama_staffpusat');
    });
  }

  // Data user firebase
  Future handleUser() async {
    if (!mounted) return;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    idStaffPusat = prefs.getInt('id_staffpusat');
    final result = (await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: idStaffPusat)
            .get())
        .docs;

    if (result.length == 0) {
      ///new user
      FirebaseFirestore.instance
          .collection('users')
          .doc(idStaffPusat.toString())
          .set({
        "id": idStaffPusat,
        "level": 0,
        "username": namaStaffPusat,
      });
    }
  }

  //Mengambil data anak dari db
  Future<List> getDataAnak() async {
    final response =
        await http.get("http://suppchild.xyz/API/daerah/getAnak.php");
    return json.decode(response.body);
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Appbar
    Widget appBar() {
      return PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Container(
            height: SizeConfig.safeBlockVertical * 10,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: colorSecondPurple),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[100],
                  ),
                  height: SizeConfig.safeBlockVertical * 7,
                  width: SizeConfig.safeBlockHorizontal * 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          size: SizeConfig.safeBlockHorizontal * 6.5,
                          color: colorMainPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(
                                  dataAnakSearch: getDataAnak(),
                                  keyword: controllerSearch.text,
                                ),
                              ));
                        },
                      ),
                      Flexible(
                        child: TextField(
                          controller: controllerSearch,
                          autofocus: false,
                          cursorColor: colorMainPurple,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: colorMainPurple,
                            fontSize: SizeConfig.safeBlockHorizontal * 5.55,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari Data Anak',
                            hintStyle: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5.55,
                              fontWeight: FontWeight.w500,
                              color: colorMainPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    MyFlutterApp.chatIcon,
                    color: colorMainPurple,
                    size: SizeConfig.safeBlockVertical * 5.25,
                  ),
                  onPressed: () {
                    handleUser();
                    setState(() {
                      Navigator.pushNamed(context, '/listChatPusat');
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(),
        body: SingleChildScrollView(
            child: PageStorage(child: currentScreen, bucket: bucket)),
        bottomNavigationBar: bmnav.BottomNav(
          index: currentTab,
          labelStyle: bmnav.LabelStyle(visible: false),
          onTap: (i) {
            setState(() {
              currentTab = i;
              currentScreen = screens[i];
            });
          },
          color: colorMainPurple,
          iconStyle: bmnav.IconStyle(
            size: SizeConfig.safeBlockVertical * 3.75,
            onSelectSize: SizeConfig.safeBlockVertical * 4.75,
            color: Colors.white,
            onSelectColor: Colors.white,
          ),
          items: [
            bmnav.BottomNavItem(Icons.home),
            bmnav.BottomNavItem(Icons.event_available),
            bmnav.BottomNavItem(Icons.child_care),
            bmnav.BottomNavItem(Icons.report),
            bmnav.BottomNavItem(Icons.account_circle)
          ],
        ),
      ),
    );
  }
}

class SelectedScreen extends StatelessWidget {
  final String selectedScreen;
  SelectedScreen({this.selectedScreen});

  @override
  Widget build(BuildContext context) {
    switch (this.selectedScreen) {
      case 'kegiatan':
        {
          return KegiatanCabang();
        }
        break;
      case 'anak':
        {
          return DataAnakCabang();
        }
        break;
      case 'kasus':
        {
          return KasusCabang();
        }
        break;
      case 'profil':
        {
          return ProfilePagePusat();
        }
        break;
      default:
        {
          return HomeScreen();
        }
        break;
    }
  }
}
