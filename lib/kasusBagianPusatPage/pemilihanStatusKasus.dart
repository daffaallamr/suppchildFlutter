import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

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

class PemilihanStatusKasus extends StatelessWidget {
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
          "TERIMA",
          "SELESAI",
          "PROSES",
          "PANTAU",
        ],
        radioButtonValue: (values) {
          print(values);
        },
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
                Navigator.pushNamed(context, '/search');
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
                          dataKegiatan('Nama Anak:', 'Ananda Agustinus'),
                          dataKegiatan('Tempat:', 'Daerah Lamongan'),
                          dataKegiatan('Kasus:', 'Pelecehan seksual yang dilakukan oleh warga Kota Lamongan kepada anak dibawah umur.'),
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
