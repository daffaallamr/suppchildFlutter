import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

import '../rootDaerah.dart';

Widget titleForm(title) {
  return Text(
    '$title',
    style: TextStyle(
      color: colorMainPurple,
      fontSize: SizeConfig.safeBlockHorizontal * 7,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    ),
  );
}

Widget petunjukData() {
  return Container(
    width: SizeConfig.safeBlockHorizontal * 85,
    child: Card(
      color: Colors.grey[100],
      elevation: 4.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Angka kondisi 5:',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorSecondPurple,
                  ),
                ),
                spasiBaris(0.5),
                Text(
                  'Kondisi anak Sangat Baik',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorSecondPurple,
                  ),
                ),
              ],
            ),
            spasiBaris(2.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Angka kondisi 4:',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorMainPurple,
                  ),
                ),
                spasiBaris(0.5),
                Text(
                  'Kondisi anak Baik',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorMainPurple,
                  ),
                ),
              ],
            ),
            spasiBaris(2.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Angka kondisi 3:',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorSecondPurple,
                  ),
                ),
                spasiBaris(0.5),
                Text(
                  'Kondisi anak Cukup',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorSecondPurple,
                  ),
                ),
              ],
            ),
            spasiBaris(2.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Angka kondisi 2:',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorMainPurple,
                  ),
                ),
                spasiBaris(0.5),
                Text(
                  'Kondisi anak Kurang',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorMainPurple,
                  ),
                ),
              ],
            ),
            spasiBaris(2.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Angka kondisi 1:',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorSecondPurple,
                  ),
                ),
                spasiBaris(0.5),
                Text(
                  'Kondisi anak Sangat Cukup',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: colorSecondPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String tglUpload = dateFormat.format(DateTime.now());

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
      "created_at": tglUpload,
    });
    print('berhasil!');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget formData(cont, hint) {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: cont,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            border: InputBorder.none,
            hintText: '$hint',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget formDataNumber(cont, hint) {
      return Container(
        width: SizeConfig.safeBlockHorizontal * 80,
        height: SizeConfig.safeBlockVertical * 8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextField(
          controller: cont,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            border: InputBorder.none,
            hintText: '$hint',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget formDataHalf(cont, hint, option) {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 38,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: TextFormField(
          controller: cont,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: option,
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            border: InputBorder.none,
            hintText: '$hint',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: colorSecondPurple,
            ),
          ),
        ),
      );
    }

    Widget formRead(hint) {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 55,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: colorSecondPurple,
          borderRadius: BorderRadius.circular(100),
        ),
        child: TextFormField(
          readOnly: true,
          autofocus: false,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            border: InputBorder.none,
            hintText: '$hint',
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget dropDownJenisKelamin() {
      return Container(
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: DropdownButton<String>(
          items: _jenisKelamin.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  color: colorSecondPurple,
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
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                    color: colorSecondPurple,
                  )),
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
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                    color: colorSecondPurple,
                  )),
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
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: colorMainPurple),
        ),
        child: DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                    color: colorSecondPurple,
                  )),
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
      Widget buttonbatal() {
        return Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.red,
              child: Text(
                'Tidak',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        );
      }

      Widget buttonYakin() {
        return Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                addDataAnak();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RootDaerah(selectedScreen: 'anak'),
                    ));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: colorMainPurple,
              child: Text(
                'Ya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        );
      }

      Widget contModal() {
        return AlertDialog(
          content: Container(
            height: SizeConfig.safeBlockHorizontal * 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                spasiBaris(1.0),
                Text(
                  'Apakah Anda Yakin?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                spasiBaris(2.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonYakin(),
                    buttonbatal(),
                  ],
                ),
              ],
            ),
          ),
        );
      }

      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => contModal(),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: colorMainPurple,
            child: Text(
              'Ubah',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonBatal() {
      return Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 6.5,
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Colors.redAccent,
            child: Text(
              'Batal',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('Tambah Data'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                spasiBaris(3.0),
                titleForm('Infomasi Anak'),
                spasiBaris(2.0),
                formData(controllerNama, 'Nama Lengkap'),
                spasiBaris(1.0),
                formDataNumber(controllerNIK, 'NIK'),
                spasiBaris(1.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      formDataHalf(
                          controllerTempat, 'Tempat', TextInputType.text),
                      formDataHalf(controllerTanggal, 'Tgl Lahir',
                          TextInputType.datetime),
                    ],
                  ),
                ),
                spasiBaris(1.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      formRead('Jenis Kelamin'),
                      dropDownJenisKelamin(),
                    ],
                  ),
                ),
                spasiBaris(1.0),
                formData(controllerAgama, 'Agama'),
                spasiBaris(1.0),
                formData(controllerAlamat, 'Alamat'),
                spasiBaris(1.0),
                formData(controllerWali, 'Nama Wali'),
                spasiBaris(1.0),
                spasiBaris(5.0),
                titleForm('Kondisi Anak'),
                spasiBaris(2.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      formRead('Kesehatan'),
                      dropDownKesehatan(),
                    ],
                  ),
                ),
                spasiBaris(1.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      formRead('Pendidikan'),
                      dropDownPendidikan(),
                    ],
                  ),
                ),
                spasiBaris(1.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      formRead('Ekonomi'),
                      dropDownEkonomi(),
                    ],
                  ),
                ),
                spasiBaris(5.0),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Column(
                    children: [
                      Text(
                        'Petunjuk Angka Kondisi',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: SizeConfig.safeBlockHorizontal * 5.75,
                          fontWeight: FontWeight.w600,
                          color: colorMainPurple,
                        ),
                      ),
                      spasiBaris(2.0),
                      petunjukData(),
                    ],
                  ),
                ),
                spasiBaris(8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonTambah(),
                    buttonBatal(),
                  ],
                ),
                spasiBaris(5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
