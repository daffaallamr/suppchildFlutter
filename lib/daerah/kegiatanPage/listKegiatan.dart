import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/kegiatanPage/uploadLaporanKegiatan.dart';
import 'package:suppchild_ver_1/homePageDaerah/homeScreen.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class ListKegiatan extends StatefulWidget {
  //Mengambil data kegiatan dari db
  @override
  _ListKegiatanState createState() => _ListKegiatanState();
}

class _ListKegiatanState extends State<ListKegiatan> {
  int idDaerah;

  @override
  void initState() {
    super.initState();
    _takePrefs();
  }

  _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idDaerah = prefs.getInt('id_daerah');
    });
  }

  Stream<List> getDataKegiatan() async* {
    while (true) {
      final response =
          await http.get("http://suppchild.xyz/API/daerah/getKegiatan.php");
      yield json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget buttonTambah() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 6.5,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/buatKegiatan');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: colorMainPurple,
          child: Text(
            'Ajukan Kegiatan',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 5.75,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Column(
        children: <Widget>[
          spasiBaris(2.0),
          Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/image/kegiatan.png"),
                    fit: BoxFit.fill),
              ),
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 60),
          // spasiBaris(1.0),
          Text(
            'Kegiatan Daerah $daerahuser',
            style: TextStyle(
              color: colorMainPurple,
              fontSize: SizeConfig.safeBlockHorizontal * 6.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          spasiBaris(2.0),
          buttonTambah(),
          spasiBaris(2.0),
          Container(
            width: SizeConfig.safeBlockHorizontal * 85,
            child: Card(
              color: Colors.grey[100],
              elevation: 4.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: StreamBuilder<List>(
                  stream: getDataKegiatan(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print("Error");

                    return snapshot.hasData
                        ? new ListDiterima(
                            allList: snapshot.data,
                            idDaerah: idDaerah,
                          )
                        : new Center(
                            child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.redAccent),
                            ),
                          ));
                  },
                ),
              ),
            ),
          ),
          spasiBaris(4.0),
        ],
      ),
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

    Widget listKegiatan(i, kegiatan) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UploadKegiatan(
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
                '$kegiatan',
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
        return listKegiatan(i, selectedStatus[i]['nama_kegiatan']);
      },
    );
  }
}
