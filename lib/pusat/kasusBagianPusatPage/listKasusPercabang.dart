import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/pemilihanStatusKasus.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

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
            fontSize: SizeConfig.safeBlockHorizontal * 7,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    ),
  );
}

class ListKasusPercabang extends StatefulWidget {
  final String daerah;
  ListKasusPercabang({this.daerah});

  @override
  _ListKasusPercabangState createState() =>
      _ListKasusPercabangState(daerah: daerah);
}

class _ListKasusPercabangState extends State<ListKasusPercabang> {
  String daerah;
  _ListKasusPercabangState({this.daerah});

  //Mengambil data kegiatan dari db
  Future<List> getDataKasus() async {
    final response =
        await http.get("http://suppchild.xyz/API/pusat/getKasus.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Daftar Kasus'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: <Widget>[
                    titleList('$daerah'),
                    FutureBuilder<List>(
                      future: getDataKasus(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print("Error");

                        return snapshot.hasData
                            ? new SelectedList(
                                allList: snapshot.data,
                                daerah: daerah,
                              )
                            : new Center();
                      },
                    ),
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

class SelectedList extends StatelessWidget {
  SelectedList({this.allList, this.daerah});
  final List allList;
  final String daerah;

  @override
  Widget build(BuildContext context) {
    List selectedList =
        allList.where((data) => data['daerah'] == daerah).toList();

    Widget listKasus(i, kasus) {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PemilihanStatusKasus(
                    list: selectedList,
                    index: i - 1,
                  ),
                ));
          },
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '$i. $kasus',
                style: TextStyle(
                  color: colorMainPurple,
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: selectedList == null ? 0 : selectedList.length,
      itemBuilder: (context, i) {
        return listKasus(i + 1, selectedList[i]['nama']);
      },
    );
  }
}
