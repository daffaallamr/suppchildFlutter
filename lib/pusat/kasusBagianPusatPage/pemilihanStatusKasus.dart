import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

Widget dataKasus(judul, data) {
  return Container(
    width: SizeConfig.safeBlockHorizontal * 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Card(
      elevation: 4.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$judul',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: colorMainPurple,
              ),
            ),
            spasiBaris(0.5),
            Text(
              '$data',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: colorSecondPurple,
              ),
            ),
          ],
        ),
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
              fontSize: SizeConfig.safeBlockHorizontal * 4.25,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            )),
        autoWidth: false,
        width: SizeConfig.safeBlockHorizontal * 37.5,
        height: SizeConfig.safeBlockVertical * 6.5,
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
            ? "Terima"
            : widget.list[widget.index]['status'],
        horizontal: false,
        selectedColor: colorMainPurple,
        spacing: 5,
        enableShape: true,
        absoluteZeroSpacing: false,
        customShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      );
    }

    Widget buttonSimpan() {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 6.5,
        child: RaisedButton(
          onPressed: () {
            updateStatus();
            Navigator.pop(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: colorMainPurple,
          child: Text(
            'Simpan Status',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 5.75,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Status Kasus'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                spasiBaris(3.0),
                Text(
                  'Informasi Kasus',
                  style: TextStyle(
                    color: colorMainPurple,
                    fontSize: SizeConfig.safeBlockHorizontal * 7,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                spasiBaris(3.0),
                dataKasus('Nama Anak:', widget.list[widget.index]['nama']),
                dataKasus('Tempat:', widget.list[widget.index]['tempat']),
                dataKasus('Kasus:', widget.list[widget.index]['detail']),
                spasiBaris(3.0),
                radioButton(),
                spasiBaris(15.0),
                buttonSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
