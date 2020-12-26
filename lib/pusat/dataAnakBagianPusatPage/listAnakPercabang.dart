import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/detailKondisiAnak.dart';
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
  Future<List> getDataAnak() async {
    final response =
        await http.get("http://suppchild.xyz/API/pusat/getAnak_$daerah.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Daftar Anak Binaan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: <Widget>[
                    titleList(daerah),
                    FutureBuilder<List>(
                      future: getDataAnak(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print("Error");

                        return snapshot.hasData
                            ? new ItemList(allList: snapshot.data)
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

class ItemList extends StatelessWidget {
  ItemList({this.allList});
  final List allList;

  @override
  Widget build(BuildContext context) {
    Widget listAnak(i, nama) {
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
                  builder: (context) => DetailKondisiAnak(
                    allList: allList,
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
                '$i. $nama',
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
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: allList == null ? 0 : allList.length,
      itemBuilder: (context, i) {
        return listAnak(i + 1, allList[i]['nama']);
      },
    );
  }
}
