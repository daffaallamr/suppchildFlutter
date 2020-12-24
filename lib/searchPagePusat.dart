import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/dataAnakBagianPusatPage/detailKondisiAnak.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class SearchPage extends StatefulWidget {
  final Future<List> dataAnakSearch;
  final String keyword;
  SearchPage({this.dataAnakSearch, this.keyword});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //Controller form
  TextEditingController controllerSearch;
  String currentKeyword;

  //Mengambil data anak dari db
  Future<List> getDataAnak() async {
    final response =
        await http.get("http://suppchild.xyz/API/daerah/getAnak_daerah.php");
    return json.decode(response.body);
  }

  @override
  void initState() {
    currentKeyword = widget.keyword;
    controllerSearch = new TextEditingController(text: currentKeyword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
      child: Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Wrap(
              children: <Widget>[
                FutureBuilder<List>(
                  future: widget.dataAnakSearch,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print("Error");

                    return snapshot.hasData
                        ? new ItemList(
                            allList: snapshot.data,
                            keyword: widget.keyword,
                          )
                        : new Center();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList({this.allList, this.keyword});
  final List allList;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    List selectedList = allList
        .where((data) =>
            data['nama'].toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    Widget listSearch(i, hasil) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colorMainPurple,
                width: 3,
              ),
            ),
          ),
          width: double.infinity,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailKondisiAnak(
                      allList: selectedList,
                      index: i - 1,
                    ),
                  ));
            },
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$hasil',
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
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: selectedList == null ? 0 : selectedList.length,
      itemBuilder: (context, i) {
        return listSearch(i + 1, selectedList[i]['nama']);
      },
    );
  }
}
