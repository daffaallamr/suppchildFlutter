import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/main.dart';

import '../rootDaerah.dart';

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

class TambahAnak extends StatefulWidget {
  @override
  _TambahAnakState createState() => _TambahAnakState();
}

class _TambahAnakState extends State<TambahAnak> {
  var _currencies = ['-', '1', '2', '3', '4', '5'];
  var _currentKesehatanSelected = '-';
  var _currentPendidikanSelected = '-';
  var _currentEkonomiSelected = '-';

  var _jenisKelamin = ['-', 'L', 'P'];
  var _currentKelaminSelected = '-';

  //Controller form
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerNIK = new TextEditingController();
  TextEditingController controllerTempat = new TextEditingController();
  TextEditingController controllerTanggal = new TextEditingController();
  TextEditingController controllerKelamin = new TextEditingController();
  TextEditingController controllerAgama = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerWali = new TextEditingController();
  TextEditingController controllerKesehatan = new TextEditingController();
  TextEditingController controllerPendidikan = new TextEditingController();
  TextEditingController controllerEkonomi = new TextEditingController();

  void addDataAnak() {
    var url = "http://suppchild.xyz/API/daerah/addAnak.php";

    http.post(url, body: {
      "nama": controllerNama.text,
      "nik": controllerNIK.text,
      "tempat_lahir": controllerTempat.text,
      "tgl_lahir": controllerTanggal.text,
      "jenis_kelamin": controllerKelamin.text,
      "agama": controllerAgama.text,
      "alamat": controllerAlamat.text,
      "wali": controllerWali.text,
      "kesehatan": controllerKesehatan.text,
      "pendidikan": controllerPendidikan.text,
      "ekonomi": controllerEkonomi.text,
      "daerah": daerahuser,
    });
    print('berhasil!');
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
            border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
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
            border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
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
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: TextFormField(
          controller: cont,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: option,
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
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
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

    Widget dropDownJenisKelamin() {
      return Container(
        height: 60,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
        ),
        child: DropdownButton<String>(
          items: _jenisKelamin.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: colorMainPurple,
                ),
              ),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentKelaminSelected = newValueSelected;
              controllerKelamin.text = newValueSelected;
            });
          },
          value: _currentKelaminSelected,
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
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
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
              this._currentKesehatanSelected = newValueSelected;
              controllerKesehatan.text = newValueSelected;
            });
          },
          value: _currentKesehatanSelected,
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
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
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
              this._currentPendidikanSelected = newValueSelected;
              controllerPendidikan.text = newValueSelected;
            });
          },
          value: _currentPendidikanSelected,
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
          border: Border.all(width: 2.0, color: Color(0xFF7B417B)),
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
              this._currentEkonomiSelected = newValueSelected;
              controllerEkonomi.text = newValueSelected;
            });
          },
          value: _currentEkonomiSelected,
        ),
      );
    }

    Widget buttonTambah() {
      return Center(
        child: Container(
          width: 160,
          child: RaisedButton(
            onPressed: () {
              addDataAnak();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RootDaerah(selectedScreen: 'anak'),
                  ));
            },
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: colorMainPurple,
            child: Text(
              'TAMBAH',
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
        appBar: appBarTitle('Tambah Data'),
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
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formDataHalf(
                            controllerTempat, 'Tempat', TextInputType.text),
                        formDataHalf(controllerTanggal, 'Tanggal',
                            TextInputType.datetime),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formRead('Jenis Kelamin'),
                        dropDownJenisKelamin(),
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
                      buttonTambah(),
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
