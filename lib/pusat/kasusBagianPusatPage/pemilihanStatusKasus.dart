import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

Widget dataKegiatan(judul, data) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$judul',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(0.5),
          Text(
            '$data',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: colorMainOrange,
            ),
          ),
        ],
      ),
    ),
  );
}

class PemilihanStatusKasus extends StatefulWidget {
  final List list;
  final int index;
  PemilihanStatusKasus({this.list, this.index});

  @override
  _PemilihanStatusKasusState createState() => _PemilihanStatusKasusState();
}

class _PemilihanStatusKasusState extends State<PemilihanStatusKasus> {
  TextEditingController controllerStatus;

  void updateStatus() {
    var url = "http://suppchild.xyz/API/pusat/updateStatusKasus.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "status": controllerStatus.text,
    });
    print('berhasil!');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget radioButton() {
      return CustomRadioButton(
        buttonTextStyle: ButtonTextStyle(
          selectedColor: Colors.white,
          unSelectedColor: Colors.white,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.safeBlockHorizontal * 5.5,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        autoWidth: false,
        width: SizeConfig.safeBlockHorizontal * 35,
        enableButtonWrap: true,
        wrapAlignment: WrapAlignment.center,
        unSelectedColor: colorSecondPurple,
        buttonLables: [
          "TERIMA",
          "SELESAI",
          "PROSES",
          "PANTAU",
        ],
        buttonValues: [
          "Terima",
          "Selesai",
          "Proses",
          "Pantau",
        ],
        radioButtonValue: (values) {
          controllerStatus = new TextEditingController(text: values);
        },
        defaultSelected: widget.list[widget.index]['status'] == null
            ? ["Terima"]
            : widget.list[widget.index]['status'],
        horizontal: false,
        height: SizeConfig.safeBlockVertical * 7,
        selectedColor: colorMainPurple,
        spacing: 10,
        enableShape: true,
        absoluteZeroSpacing: false,
        customShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      );
    }

    Widget buttonSimpan() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                updateStatus();
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: colorMainOrange,
              child: Text(
                'SIMPAN STATUS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      );
    }

    final size = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarTitle('Status Kasus'),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: size.size.width / 1.1,
              // decoration: BoxDecoration(
              //     // border: Border.all(color: colorMainPurple),
              // ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: <Widget>[
                    spasiBaris(3.0),
                    Text(
                      'Detail Kasus',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 8,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(7.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.redAccent)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          dataKegiatan(
                              'Nama Anak:', widget.list[widget.index]['nama']),
                          spasiBaris(3.0),
                          dataKegiatan(
                              'Tempat:', widget.list[widget.index]['tempat']),
                          spasiBaris(3.0),
                          dataKegiatan(
                              'Kasus:', widget.list[widget.index]['detail']),
                          spasiBaris(5.0),
                          radioButton(),
                          spasiBaris(6.5),
                          buttonSimpan(),
                        ],
                      ),
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
