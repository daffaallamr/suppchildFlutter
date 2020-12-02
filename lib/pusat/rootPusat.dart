import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/dataAnakCabang.dart';
import 'package:suppchild_ver_1/homePage/homeScreen.dart';
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/kasusCabang.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/kegiatanCabang.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/profilPage/profil.dart';
import 'package:bmnav/bmnav.dart' as bmnav;

class RootPusat extends StatefulWidget {

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPusat> {

  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    KegiatanCabang(),
    DataAnakCabang(),
    KasusCabang(),
    ProfilePage()
  ];
  Widget currentScreen = DataAnakCabang();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {

    // Appbar
    Widget appBar () {
      return PreferredSize(
        preferredSize: Size(
            double.infinity, 70
        ),
        child: Container(
          height: 70,
          color: colorMainPurple,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                height: 45,
                width: 270,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
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
              child: PageStorage(child: currentScreen, bucket: bucket)
          ),
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
