import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/daerah/dataAnakPage/listAnak.dart';
import 'package:suppchild_ver_1/daerah/kasusPage/listKasus.dart';
import 'package:suppchild_ver_1/daerah/kegiatanPage/listKegiatan.dart';
import 'package:suppchild_ver_1/homePage/homeScreen.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/my_flutter_app_icons.dart';
import 'package:suppchild_ver_1/profilPage/profil.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'package:suppchild_ver_1/searchPageDaerah.dart';

class RootDaerah extends StatefulWidget {
  final String selectedScreen;
  final int idPassing;
  final Future<List> dataAnakSearch;
  RootDaerah({this.selectedScreen, this.dataAnakSearch, this.idPassing});

  @override
  _RootPageState createState() =>
      _RootPageState(selectedScreen: selectedScreen);
}

class _RootPageState extends State<RootDaerah> {
  TextEditingController controllerSearch = new TextEditingController();
  int idUser;
  String userLevel;
  String nama;
  String daerahuser;

  final String selectedScreen;
  _RootPageState({this.selectedScreen});

  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    ListKegiatan(),
    ListAnak(),
    ListKasus(),
    ProfilePage()
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
      idUser = prefs.getInt('idUser');
      userLevel = prefs.getString('userLevel');
      nama = prefs.getString('nama');
      daerahuser = prefs.getString('daerahuser');
    });
  }

  // Data user firebase
  Future handleUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final result = (await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: widget.idPassing)
            .get())
        .docs;

    if (result.length == 0) {
      ///new user
      FirebaseFirestore.instance
          .collection('users')
          .doc(idUser.toString())
          .set({
        "id": idUser,
        "level": userLevel,
        "username": nama,
        "name": daerahuser,
      });
    } else {
      ///Old user
      sharedPreferences.setInt("id", result[0]["id"]);
      sharedPreferences.setString("name", result[0]["name"]);
    }
  }

  //Mengambil data anak dari db
  Future<List> getDataAnak() async {
    final response =
        await http.get("http://suppchild.xyz/API/daerah/getAnak_daerah.php");
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
                                builder: (context) => SearchPageDaerah(
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
                      Navigator.pushNamed(context, '/listChatDaerah');
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
            onSelectSize: SizeConfig.safeBlockVertical * 3.75,
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
          return ListKegiatan();
        }
        break;
      case 'anak':
        {
          return ListAnak();
        }
        break;
      case 'kasus':
        {
          return ListKasus();
        }
        break;
      case 'profil':
        {
          return ProfilePage();
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
