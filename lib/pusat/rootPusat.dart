import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/homePage/homeScreen.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/profilPage/profil.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/dataAnakCabang.dart';
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/kasusCabang.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/kegiatanCabang.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'package:suppchild_ver_1/searchPagePusat.dart';

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

  final String selectedScreen;
  _RootPageState({this.selectedScreen});

  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    KegiatanCabang(),
    DataAnakCabang(),
    KasusCabang(),
    ProfilePage()
  ];

  Widget currentScreen;
  @override
  void initState() {
    currentScreen = new SelectedScreen(selectedScreen: selectedScreen);
    super.initState();
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
        child: Container(
          height: SizeConfig.safeBlockVertical * 11,
          color: colorMainPurple,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          bottomLeft: Radius.circular(6.0)),
                      color: Colors.white,
                    ),
                    height: SizeConfig.safeBlockVertical * 7,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: SizeConfig.safeBlockHorizontal * 7,
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
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6.0),
                          bottomRight: Radius.circular(6.0)),
                      color: Colors.white,
                    ),
                    height: SizeConfig.safeBlockVertical * 7,
                    width: SizeConfig.safeBlockHorizontal * 60,
                    child: TextField(
                      controller: controllerSearch,
                      autofocus: false,
                      cursorColor: colorMainPurple,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Cari',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.2,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                  size: SizeConfig.safeBlockVertical * 6,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/listChat');
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
              size: SizeConfig.safeBlockVertical * 4,
              onSelectSize: SizeConfig.safeBlockVertical * 4,
              color: Colors.white,
              onSelectColor: Colors.white,
            ),
            items: [
              bmnav.BottomNavItem(Icons.home),
              bmnav.BottomNavItem(Icons.event),
              bmnav.BottomNavItem(Icons.child_care),
              bmnav.BottomNavItem(Icons.assignment),
              bmnav.BottomNavItem(Icons.account_circle)
            ],
          ),
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
