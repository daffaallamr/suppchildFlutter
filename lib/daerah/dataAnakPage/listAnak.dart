import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/dataAnakPage/ubahDataAnak.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class ListAnak extends StatefulWidget {
  @override
  _ListAnakState createState() => _ListAnakState();
}

class _ListAnakState extends State<ListAnak> {
  //Mengambil data anak dari db
  Future<List> getDataAnak() async {
    final response =
        await http.get("http://suppchild.xyz/API/daerah/getAnak_daerah.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonTambah() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 22, 10, 22),
        child: Center(
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 90,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tambahAnak');
              },
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: colorMainPurple,
              child: Text(
                'Tambah Data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        buttonTambah(),
        Container(
          width: SizeConfig.safeBlockHorizontal * 90,
          child: Wrap(
            children: <Widget>[
              Container(
                child: Container(
                  color: colorMainPurple,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(
                      child: Text(
                        '$daerahuser',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FutureBuilder<List>(
                future: getDataAnak(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print("Error");

                  return snapshot.hasData
                      ? new ItemList(
                          allList: snapshot.data,
                          daerahuser: daerahuser,
                        )
                      : new Center();
                },
              ),
            ],
          ),
        ),
        spasiBaris(8.0),
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList({this.allList, this.daerahuser});
  final List allList;
  final String daerahuser;

  @override
  Widget build(BuildContext context) {
    List selectedList =
        allList.where((data) => data['daerah'] == daerahuser).toList();
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
                  builder: (context) => UbahDataAnak(
                    selectedList: selectedList,
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
                  fontSize: 22,
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
      itemCount: selectedList == null ? 0 : selectedList.length,
      itemBuilder: (context, i) {
        return listAnak(i + 1, selectedList[i]['nama']);
      },
    );
  }
}
