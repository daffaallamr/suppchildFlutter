import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/approveKegiatan.dart';
import 'package:suppchild_ver_1/pusat/kegiatanBagianPusatPage/laporanKegiatan.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

Widget titleList(title) {
  return Text(
    '$title',
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: SizeConfig.safeBlockHorizontal * 6,
      fontWeight: FontWeight.w600,
      color: colorMainPurple,
    ),
  );
}

class ListSemuaKegiatan extends StatefulWidget {
  final int idDaerah;
  ListSemuaKegiatan({this.idDaerah});

  @override
  _ListSemuaKegiatanState createState() => _ListSemuaKegiatanState();
}

class _ListSemuaKegiatanState extends State<ListSemuaKegiatan> {
  //Mengambil data kegiatan dari db
  Stream<List> getDataKegiatan() async* {
    while (true) {
      final response =
          await http.get("http://suppchild.xyz/API/pusat/getKegiatan.php");
      yield json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Daftar Kegiatan'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  titleList('Kegiatan Diajukan'),
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
                          stream: getDataKegiatan(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print("Error");

                            return snapshot.hasData
                                ? new ListDiajukan(
                                    allList: snapshot.data,
                                    idDaerah: widget.idDaerah,
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
                  spasiBaris(6.0),
                  titleList('Kegiatan Diterima'),
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
                          stream: getDataKegiatan(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print("Error");

                            return snapshot.hasData
                                ? new ListDiterima(
                                    allList: snapshot.data,
                                    idDaerah: widget.idDaerah,
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

class ListDiajukan extends StatelessWidget {
  ListDiajukan({this.allList, this.idDaerah});
  final List allList;
  final int idDaerah;

  @override
  Widget build(BuildContext context) {
    List selectedList = allList
        .where((data) => data['id_daerah'] == idDaerah.toString())
        .toList();

    List selectedStatus =
        selectedList.where((data) => data['id_status'] == null).toList();

    Widget listData(i, hasil) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ApproveKegiatan(
                  list: selectedStatus,
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
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: selectedStatus == null ? 0 : selectedStatus.length,
      itemBuilder: (context, i) {
        return listData(i, selectedStatus[i]['nama_kegiatan']);
      },
    );
  }
}

class ListDiterima extends StatelessWidget {
  ListDiterima({this.allList, this.idDaerah});
  final List allList;
  final int idDaerah;

  @override
  Widget build(BuildContext context) {
    List selectedList = allList
        .where((data) => data['id_daerah'] == idDaerah.toString())
        .toList();

    List selectedStatus =
        selectedList.where((data) => data['id_status'] == '1').toList();

    Widget listData(i, hasil) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LaporanKegiatan(
                  list: selectedStatus,
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
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: selectedStatus == null ? 0 : selectedStatus.length,
      itemBuilder: (context, i) {
        return listData(i, selectedStatus[i]['nama_kegiatan']);
      },
    );
  }
}
