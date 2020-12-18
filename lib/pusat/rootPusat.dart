import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/homePage/homeScreen.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/profilPage/profil.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/dataAnakCabang.dart';
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/kasusCabang.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/kegiatanCabang.dart';

class RootPusat extends StatefulWidget {
  final String selectedScreen;
  RootPusat({this.selectedScreen});

  @override
  _RootPageState createState() =>
      _RootPageState(selectedScreen: selectedScreen);
}

class _RootPageState extends State<RootPusat> {
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

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    // Appbar
    Widget appBar() {
      return PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: Container(
          height: 70,
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
                    height: 45,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
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
                    height: 45,
                    width: 230,
                    child: TextField(
                      autofocus: false,
                      cursorColor: colorMainPurple,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
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
                  size: 40,
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
              size: 30,
              onSelectSize: 30,
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
