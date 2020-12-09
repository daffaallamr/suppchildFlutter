import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  //Controller form
  TextEditingController controllerSearch;

  @override
  void initState() {
    controllerSearch = new TextEditingController(text: 'Ananda');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listSearch(hasil) {
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
              Navigator.pushNamed(context, '/login');
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
                      controller: controllerSearch,
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
      child: Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Wrap(
              children: <Widget>[
                listSearch('Ananda Saheya'),
                listSearch('Ananda Putra'),
                listSearch('Ananda Lazuardy'),
                listSearch('Matari Anan'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
