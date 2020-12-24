import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/kegiatanPage/uploadLaporanKegiatan.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class ListKegiatan extends StatelessWidget {
  //Mengambil data kegiatan dari db
  Future<List> getDataKegiatan() async {
    final response =
        await http.get("http://suppchild.xyz/API/daerah/getKegiatan.php");
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
                Navigator.pushNamed(context, '/buatKegiatan');
              },
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: colorMainPurple,
              child: Text(
                'Tambah Kegiatan',
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
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        daerahuser,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
      ],
    );
  }
}

class ListDiterima extends StatelessWidget {
  ListDiterima({this.allList});
  final List allList;

  @override
  Widget build(BuildContext context) {
    List selectedList =
        allList.where((data) => data['pengaju'] == daerahuser).toList();

    List selectedStatus =
        selectedList.where((data) => data['status'] == 'diterima').toList();

    Widget listKegiatan(i, kegiatan) {
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
                  builder: (context) => UploadKegiatan(
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
                '$i. $kegiatan',
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
      itemCount: selectedStatus == null ? 0 : selectedStatus.length,
      itemBuilder: (context, i) {
        return listKegiatan(i + 1, selectedStatus[i]['nama']);
      },
    );
  }
}
