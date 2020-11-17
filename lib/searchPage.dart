import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget listSearch(hasil) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
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

    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('CARI'),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                          'Kata Kunci: ',
                          style: TextStyle(
                          color: colorMainPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        'Ananda',
                        style: TextStyle(
                          color: colorMainPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                spasiBaris(50.0),
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
