import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/approveKegiatan.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/laporanKegiatan.dart';

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
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    ),
  );
}

class ListSemuaKegiatan extends StatefulWidget {
  @override
  _ListSemuaKegiatanState createState() => _ListSemuaKegiatanState();
}

class _ListSemuaKegiatanState extends State<ListSemuaKegiatan> {
  //Mengambil data kegiatan dari db
  Future<List> getDataKegiatan() async {
    final response =
        await http.get("http://suppchild.xyz/API/pusat/getKegiatan.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Daftar Kegiatan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: <Widget>[
                    titleList('Yang Diajukan'),
                    FutureBuilder<List>(
                      future: getDataKegiatan(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print("Error");

                        return snapshot.hasData
                            ? new ListDiajukan(
                                allList: snapshot.data,
                              )
                            : new Center();
                      },
                    ),
                    spasiBaris(40.0),
                    titleList('Yang Diterima'),
                    FutureBuilder<List>(
                      future: getDataKegiatan(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print("Error");

                        return snapshot.hasData
                            ? new ListDiterima(
                                allList: snapshot.data,
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

class ListDiajukan extends StatelessWidget {
  ListDiajukan({this.allList});
  final List allList;

  @override
  Widget build(BuildContext context) {
    List selectedList =
        allList.where((data) => data['pengaju'] == 'Gresik').toList();

    List selectedStatus =
        selectedList.where((data) => data['status'] == null).toList();

    Widget listKegiatanDiajukan(i, pengajuan) {
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
                  builder: (context) => ApproveKegiatan(
                    list: selectedStatus,
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
                '$i. $pengajuan',
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
      itemCount: selectedStatus == null ? 0 : selectedStatus.length,
      itemBuilder: (context, i) {
        return listKegiatanDiajukan(i + 1, selectedStatus[i]['nama']);
      },
    );
  }
}

class ListDiterima extends StatelessWidget {
  ListDiterima({this.allList});
  final List allList;

  @override
  Widget build(BuildContext context) {
    List selectedList =
        allList.where((data) => data['pengaju'] == 'Gresik').toList();

    List selectedStatus =
        selectedList.where((data) => data['status'] == 'diterima').toList();

    Widget listKegiatanDiterima(i, ongoing) {
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
                  builder: (context) => LaporanKegiatan(
                    list: selectedStatus,
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
                '$i. $ongoing',
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
      itemCount: selectedStatus == null ? 0 : selectedStatus.length,
      itemBuilder: (context, i) {
        return listKegiatanDiterima(i + 1, selectedStatus[i]['nama']);
      },
    );
  }
}
