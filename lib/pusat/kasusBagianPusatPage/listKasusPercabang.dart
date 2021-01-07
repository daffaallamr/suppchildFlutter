import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/kasusBagianPusatPage/pemilihanStatusKasus.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

Widget titleList(title) {
  return Text(
    'Kasus di $title',
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: SizeConfig.safeBlockHorizontal * 6,
      fontWeight: FontWeight.w600,
      color: colorMainPurple,
    ),
  );
}

class ListKasusPercabang extends StatefulWidget {
  final int idDaerah;
  ListKasusPercabang({this.idDaerah});

  @override
  _ListKasusPercabangState createState() =>
      _ListKasusPercabangState(idDaerah: idDaerah);
}

class _ListKasusPercabangState extends State<ListKasusPercabang> {
  int idDaerah;
  _ListKasusPercabangState({this.idDaerah});

  //Mengambil data kegiatan dari db
  Stream<List> getDataKasus() async* {
    while (true) {
      final response =
          await http.get("http://suppchild.xyz/API/pusat/getKasus.php");
      yield json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Daftar Kasus'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  titleList(idDaerah == 1
                      ? 'Gresik'
                      : idDaerah == 2
                          ? 'Bangkalan'
                          : idDaerah == 3
                              ? 'Mojokerto'
                              : idDaerah == 4
                                  ? 'Surabaya'
                                  : idDaerah == 5
                                      ? 'Sidoarjo'
                                      : 'Lamongan'),
                  spasiBaris(2.0),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 90,
                    child: Card(
                      color: Colors.grey[100],
                      elevation: 4.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: StreamBuilder<List>(
                          stream: getDataKasus(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print("Error");

                            return snapshot.hasData
                                ? new SelectedList(
                                    allList: snapshot.data,
                                    idDaerah: idDaerah,
                                  )
                                : new Center(
                                    child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.redAccent),
                                    ),
                                  ));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedList extends StatelessWidget {
  SelectedList({this.allList, this.idDaerah});
  final List allList;
  final int idDaerah;

  @override
  Widget build(BuildContext context) {
    List selectedList = allList
        .where((data) => data['id_daerah'] == idDaerah.toString())
        .toList();

    Widget listData(i, hasil) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PemilihanStatusKasus(
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
                '$hasil',
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
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: selectedList == null ? 0 : selectedList.length,
      itemBuilder: (context, i) {
        return listData(i, selectedList[i]['nama']);
      },
    );
  }
}
