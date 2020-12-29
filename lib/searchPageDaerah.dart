import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/dataAnakPage/ubahDataAnak.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/my_flutter_app_icons.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class SearchPageDaerah extends StatefulWidget {
  final Future<List> dataAnakSearch;
  final String keyword;
  SearchPageDaerah({this.dataAnakSearch, this.keyword});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPageDaerah> {
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Container(
            height: SizeConfig.safeBlockVertical * 10,
            color: Color.fromRGBO(170, 127, 198, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[100]),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[100],
                  ),
                  height: SizeConfig.safeBlockVertical * 7,
                  width: SizeConfig.safeBlockHorizontal * 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          size: SizeConfig.safeBlockHorizontal * 6.5,
                          color: colorMainPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPageDaerah(
                                  dataAnakSearch: getDataAnak(),
                                  keyword: controllerSearch.text,
                                ),
                              ));
                        },
                      ),
                      Flexible(
                        child: TextField(
                          controller: controllerSearch,
                          autofocus: false,
                          cursorColor: colorMainPurple,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: colorMainPurple,
                            fontSize: SizeConfig.safeBlockHorizontal * 5.55,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari Data Anak',
                            hintStyle: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5.55,
                              fontWeight: FontWeight.w500,
                              color: colorMainPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    MyFlutterApp.chatIcon,
                    color: Colors.grey[100],
                    size: SizeConfig.safeBlockVertical * 5.25,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, '/listChatDaerah');
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorSecondPurple,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                spasiBaris(1.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 91,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    children: [
                      spasiBaris(3.0),
                      Wrap(
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
                      spasiBaris(3.0),
                    ],
                  ),
                ),
                spasiBaris(3.0),
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

    List selectedStatus =
        selectedList.where((data) => data['daerah'] == daerahuser).toList();

    Widget listSearch(i, hasil) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UbahDataAnak(
                  selectedList: selectedStatus,
                  index: i,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
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
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: selectedStatus == null ? 0 : selectedStatus.length,
      itemBuilder: (context, i) {
        return listSearch(i, selectedStatus[i]['nama']);
      },
    );
  }
}
