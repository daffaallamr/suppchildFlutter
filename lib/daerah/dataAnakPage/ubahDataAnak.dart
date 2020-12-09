import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/main.dart';

Widget titleForm(title) {
  return Text(
    '$title',
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: colorMainPurple,
    ),
  );
}

class UbahDataAnak extends StatefulWidget {

  final List selectedList;
  final int index;
  UbahDataAnak({this.selectedList, this.index});

  @override
  _UbahAnakState createState() => _UbahAnakState();
}

class _UbahAnakState extends State<UbahDataAnak> {
  var _currencies = ['-', '1', '2', '3', '4', '5'];

  //Controller form
  TextEditingController controllerNama;
  TextEditingController controllerNIK;
  TextEditingController controllerTempat;
  TextEditingController controllerTanggal;
  TextEditingController controllerAgama;
  TextEditingController controllerAlamat;
  TextEditingController controllerWali;
  TextEditingController controllerKesehatan;
  TextEditingController controllerPendidikan;
  TextEditingController controllerEkonomi;

  void editDataAnak() {
    var url = "http://10.0.2.2/suppChild_db/daerah/ubahAnak.php";

    http.post(url, body: {
      "id": widget.selectedList[widget.index]['id'],
      "nama": controllerNama.text,
      "nik": controllerNIK.text,
      "tempat_lahir": controllerTempat.text,
      "tgl_lahir": controllerTanggal.text,
      "agama": controllerAgama.text,
      "alamat": controllerAlamat.text,
      "wali": controllerWali.text,
      "kesehatan": controllerKesehatan.text,
      "pendidikan": controllerPendidikan.text,
      "ekonomi": controllerEkonomi.text,
    });
    print('berhasil!');
  }

  @override
  void initState() {
    controllerNama = new TextEditingController(text: widget.selectedList[widget.index]['nama']);
    controllerNIK = new TextEditingController(text: widget.selectedList[widget.index]['nik']);
    controllerTempat = new TextEditingController(text: widget.selectedList[widget.index]['tempat_lahir']);
    controllerTanggal = new TextEditingController(text: widget.selectedList[widget.index]['tgl_lahir']);
    controllerAgama = new TextEditingController(text: widget.selectedList[widget.index]['agama']);
    controllerAlamat = new TextEditingController(text: widget.selectedList[widget.index]['alamat']);
    controllerWali = new TextEditingController(text: widget.selectedList[widget.index]['wali']);
    controllerKesehatan = new TextEditingController(text: widget.selectedList[widget.index]['kesehatan']);
    controllerPendidikan = new TextEditingController(text: widget.selectedList[widget.index]['pendidikan']);
    controllerEkonomi = new TextEditingController(text: widget.selectedList[widget.index]['ekonomi']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget formData(cont, hint) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 2.0,
                color: Color(0xFF7B417B)),
          ),
          child: TextField(
            controller: cont,
            autofocus: false,
            cursorColor: colorMainPurple,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
              border: InputBorder.none,
              hintText: '$hint',
              hintStyle: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
                color: colorMainPurple,
              ),
            ),
          ),
        ),
      );
    }
    Widget formDataNumber(cont, hint) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 2.0,
                color: Color(0xFF7B417B)),
          ),
          child: TextField(
            controller: cont,
            autofocus: false,
            cursorColor: colorMainPurple,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
              border: InputBorder.none,
              hintText: '$hint',
              hintStyle: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
                color: colorMainPurple,
              ),
            ),
          ),
        ),
      );
    }
    Widget formDataHalf(cont, hint, option) {
      return Container(
        height: 60,
        width: 180,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2.0,
              color: Color(0xFF7B417B)),
        ),
        child: TextFormField(
          controller: cont,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: option,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            border: InputBorder.none,
            hintText: '$hint',
            hintStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
        ),
      );
    }
    Widget formRead(hint) {
      return Container(
        height: 60,
        width: 260,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2.0,
              color: Color(0xFF7B417B)),
        ),
        child: TextFormField(
          readOnly: true,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            border: InputBorder.none,
            hintText: '$hint',
            hintStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
              color: colorMainPurple,
            ),
          ),
        ),
      );
    }


    Widget dropDownKesehatan() {
      return Container(
        height: 60,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2.0,
              color: Color(0xFF7B417B)),
        ),
        child: DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
            );
          }).toList(),

          onChanged: (String newValueSelected) {
            setState(() {
              controllerKesehatan.text = newValueSelected;
            });
          },
          value: controllerKesehatan.text,
        ),
      );
    }
    Widget dropDownPendidikan() {
      return Container(
        height: 60,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2.0,
              color: Color(0xFF7B417B)),
        ),
        child: DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
            );
          }).toList(),

          onChanged: (String newValueSelected) {
            setState(() {
              controllerPendidikan.text = newValueSelected;
            });
          },
          value: controllerPendidikan.text,
        ),
      );
    }
    Widget dropDownEkonomi() {
      return Container(
        height: 60,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2.0,
              color: Color(0xFF7B417B)),
        ),
        child: DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
            );
          }).toList(),

          onChanged: (String newValueSelected) {
            setState(() {
              controllerEkonomi.text = newValueSelected;
            });
          },
          value: controllerEkonomi.text,
        ),
      );
    }

    Widget buttonUbah() {
      return Center(
        child: Container(
          width: 160,
          child: RaisedButton(
            onPressed: () {
              editDataAnak();
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              'UBAH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      );
    }
    Widget buttonBatal() {
      return Center(
        child: Container(
          width: 160,
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainOrange,
            child: Text(
              'BATAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
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
        appBar: appBarTitle('Ubah Data'),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              // border: Border.all(color: colorMainPurple),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 24, 14, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  titleForm('Infomasi Anak'),
                  formData(controllerNama, 'Nama Lengkap'),
                  formDataNumber(controllerNIK, 'NIK'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formDataHalf(controllerTempat, 'Tempat', TextInputType.text),
                        formDataHalf(controllerTanggal, 'Tanggal', TextInputType.datetime),
                      ],
                    ),
                  ),
                  formData(controllerAgama, 'Agama'),
                  formData(controllerAlamat, 'Alamat'),
                  formData(controllerWali, 'Nama Wali'),
                  spasiBaris(40.0),
                  titleForm('Kondisi Anak'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formRead('Kesehatan'),
                        dropDownKesehatan(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formRead('Pendidikan'),
                        dropDownPendidikan(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formRead('Ekonomi'),
                        dropDownEkonomi(),
                      ],
                    ),
                  ),
                  spasiBaris(40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buttonUbah(),
                      buttonBatal(),
                    ],
                  ),
                  spasiBaris(20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
