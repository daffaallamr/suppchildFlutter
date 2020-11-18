import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

class ListChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Widget listChat(chat) {
      return Container(
        alignment: Alignment.centerLeft,
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
              '$chat',
              style: TextStyle(
                color: colorMainPurple,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }
    
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle("Pesan"),
        body: Center(
          child: Column(
            children: <Widget>[
              listChat("Staff Gresik"),
              listChat("Staff Bangkalan"),
              listChat("Staff Mojokerto"),
              listChat("Staff Surabaya"),
              listChat("Staff Sidoarjo"),
              listChat("Staff Lamongan"),
            ],
          ),
        ),
      ),
    );
  }
}
