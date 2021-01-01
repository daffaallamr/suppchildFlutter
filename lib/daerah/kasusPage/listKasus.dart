import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/kasusPage/statusKasus.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class ListKasus extends StatefulWidget {
  @override
  _ListKasusState createState() => _ListKasusState();
}

class _ListKasusState extends State<ListKasus> {
  String daerahuser;

  @override
  void initState() {
    super.initState();
    _takePrefs();
  }

  _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      daerahuser = prefs.getString('daerahuser');
    });
  }

  //Mengambil data kegiatan dari db
  Stream<List> getDataKasus() async* {
    while (true) {
      final response =
          await http.get("http://suppchild.xyz/API/daerah/getKasus.php");
      yield json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonTambah() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 6.5,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/unggahKasus');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: colorMainPurple,
          child: Text(
            'Tambah Laporan',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 5.75,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Column(
        children: <Widget>[
          spasiBaris(2.0),
          Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/image/laporKasus.png"),
                    fit: BoxFit.fill),
              ),
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 60),
          // spasiBaris(1.0),
          Text(
            'Kasus Daerah $daerahuser',
            style: TextStyle(
              color: colorMainPurple,
              fontSize: SizeConfig.safeBlockHorizontal * 6.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          spasiBaris(2.0),
          buttonTambah(),
          spasiBaris(2.0),
          Container(
            width: SizeConfig.safeBlockHorizontal * 85,
            child: Card(
              color: Colors.grey[100],
              elevation: 4.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: StreamBuilder<List>(
                  stream: getDataKasus(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print("Error");

                    return snapshot.hasData
                        ? new SelectedList(
                            allList: snapshot.data,
                            daerahuser: daerahuser,
                          )
                        : new Center(
                            child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.redAccent),
                            ),
                          ));
                  },
                ),
              ),
            ),
          ),
          spasiBaris(4.0),
        ],
      ),
    );
  }
}

class SelectedList extends StatelessWidget {
  SelectedList({this.allList, this.daerahuser});
  final List allList;
  final String daerahuser;
  @override
  Widget build(BuildContext context) {
    List selectedList =
        allList.where((data) => data['daerah'] == daerahuser).toList();

    Widget listKasus(i, kasus) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StatusKasus(
                  list: selectedList,
                  index: i,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(
                bottom: BorderSide(
                  color: colorSecondPurple,
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
              child: Text(
                '$kasus',
                style: TextStyle(
                  color: colorMainPurple,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return new ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: selectedList == null ? 0 : selectedList.length,
      itemBuilder: (context, i) {
        return listKasus(i, selectedList[i]['nama']);
      },
    );
  }
}
