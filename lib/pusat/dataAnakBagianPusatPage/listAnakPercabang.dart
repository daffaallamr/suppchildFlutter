import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/detailKondisiAnak.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

Widget titleList(title) {
  return Text(
    'Anak Binaan $title',
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: SizeConfig.safeBlockHorizontal * 6,
      fontWeight: FontWeight.w600,
      color: colorMainPurple,
    ),
  );
}

class ListAnakPercabang extends StatefulWidget {
  final String daerah;
  ListAnakPercabang({this.daerah});

  @override
  _ListAnakPercabangState createState() =>
      _ListAnakPercabangState(daerah: daerah);
}

class _ListAnakPercabangState extends State<ListAnakPercabang> {
  final String daerah;
  _ListAnakPercabangState({this.daerah});

  //Mengambil data anak dari db
  Stream<List> getDataAnak() async* {
    while (true) {
      final response =
          await http.get("http://suppchild.xyz/API/pusat/getAnak_$daerah.php");
      yield json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Daftar Anak Binaan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  titleList(daerah),
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
                        padding: const EdgeInsets.all(10.0),
                        child: StreamBuilder<List>(
                          stream: getDataAnak(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print("Error");

                            return snapshot.hasData
                                ? new ItemList(
                                    allList: snapshot.data,
                                  )
                                : Center(
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

class ItemList extends StatelessWidget {
  ItemList({this.allList});
  final List allList;

  @override
  Widget build(BuildContext context) {
    Widget listAnak(i, nama) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailKondisiAnak(
                  allList: allList,
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
                '$nama',
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
      itemCount: allList == null ? 0 : allList.length,
      itemBuilder: (context, i) {
        return listAnak(i, allList[i]['nama']);
      },
    );
  }
}
