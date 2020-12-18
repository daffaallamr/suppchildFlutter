import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:http/http.dart' as http;

Widget dataKegiatan(judul, data) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(12),
      // border: Border.all(
      //     width: 2.0,
      //     color: Color(0xFF7B417B)),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$judul',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
          spasiBaris(5.0),
          Text(
            '$data',
            style: TextStyle(
              fontSize: 24,
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
    Widget radioButton() {
      return CustomRadioButton(
        buttonTextStyle: ButtonTextStyle(
          selectedColor: Colors.white,
          unSelectedColor: Colors.white,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        autoWidth: false,
        width: 140,
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
        height: 50,
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
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Detail Kasus',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: colorMainPurple,
                      ),
                    ),
                    spasiBaris(50.0),
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
                          dataKegiatan(
                              'Tempat:', widget.list[widget.index]['tempat']),
                          dataKegiatan(
                              'Kasus:', widget.list[widget.index]['detail']),
                          spasiBaris(20.0),
                          radioButton(),
                          spasiBaris(40.0),
                          buttonSimpan(),
                          spasiBaris(20.0),
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
