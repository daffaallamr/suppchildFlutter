import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:http/http.dart' as http;
import 'package:suppchild_ver_1/daerah/rootDaerah.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

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

class UbahDataAnak extends StatefulWidget {
  final List selectedList;
  final int index;
  UbahDataAnak({this.selectedList, this.index});

  @override
  _UbahAnakState createState() => _UbahAnakState();
}

class _UbahAnakState extends State<UbahDataAnak> {
  var _currencies = ['-', '1', '2', '3', '4', '5'];

  var _jenisKelamin = ['-', 'L', 'P'];

  //Controller form
  TextEditingController controllerNama;
  TextEditingController controllerNIK;
  TextEditingController controllerTempat;
  TextEditingController controllerTanggal;
  TextEditingController controllerKelamin;
  TextEditingController controllerAgama;
  TextEditingController controllerAlamat;
  TextEditingController controllerWali;
  TextEditingController controllerKesehatan;
  TextEditingController controllerPendidikan;
  TextEditingController controllerEkonomi;

  //RegExp alpha
  RegExp _alpha = RegExp(r'^[a-zA-Z\s]+$');
  RegExp _numeric = RegExp(r'^-?[0-9]{16}');
  RegExp _tglLahir = RegExp(
      r'^((?:(?:1[6-9]|2[0-9])\d{2})(-)(?:(?:(?:0[13578]|1[02])(-)31)|((0[1,3-9]|1[0-2])(-)(29|30))))$|^(?:(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(-)02(-)29)$|^(?:(?:1[6-9]|2[0-9])\d{2})(-)(?:(?:0[1-9])|(?:1[0-2]))(-)(?:0[1-9]|1\d|2[0-8])$');

  /// check if string matches the pattern.
  bool isAlpha(String str) {
    return _alpha.hasMatch(str);
  }

  /// check if the string contains only numbers
  bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }

  /// check if the tgl Lahir contains right format
  bool isTglLahir(String str) {
    return _tglLahir.hasMatch(str);
  }

  bool berhasil = true;
  String msg = '';

  _checkForm() {
    if (controllerNama.text.isEmpty) {
      setState(() {
        msg = "Nama Lengkap Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (isAlpha(controllerNama.text) == false) {
      setState(() {
        msg = "Nama Lengkap tidak Boleh Berisi Angka!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerNIK.text.isEmpty) {
      setState(() {
        msg = "NIK Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (isNumeric(controllerNIK.text) == false) {
      setState(() {
        msg = "NIK Harus Angka dan 16 Dijit!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerTempat.text.isEmpty) {
      setState(() {
        msg = "Kota Kelahiran Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerTanggal.text.isEmpty) {
      setState(() {
        msg = "Tanggal Lahir Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (isTglLahir(controllerTanggal.text) == false) {
      setState(() {
        msg = "Format Tanggal Lahir Salah!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerKelamin.text == '-') {
      setState(() {
        msg = "Form Jenis Kelamin masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerAgama.text.isEmpty) {
      setState(() {
        msg = "Form Agama Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (isAlpha(controllerAgama.text) == false) {
      setState(() {
        msg = "Form Agama tidak Boleh Berisi Angka!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerAlamat.text.isEmpty) {
      setState(() {
        msg = "Alamat Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerWali.text.isEmpty) {
      setState(() {
        msg = "Nama Wali Masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (isAlpha(controllerWali.text) == false) {
      setState(() {
        msg = "Nama Wali tidak Boleh Berisi Angka!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerKesehatan.text == '-') {
      setState(() {
        msg = "Kondisi Kesehatan masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerPendidikan.text == '-') {
      setState(() {
        msg = "Kondisi Pendidikan masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else if (controllerEkonomi.text == '-') {
      setState(() {
        msg = "Kondisi Ekonomi masih Kosong!";
        berhasil = false;
        print(msg);
      });
    } else {
      msg = "";
      berhasil = true;
    }
  }

  Widget alertGagal() {
    return Center(
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: SizeConfig.safeBlockHorizontal * 4,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  void editDataAnak() {
    var url = "http://suppchild.xyz/API//daerah/ubahAnak.php";

    http.post(url, body: {
      "id": widget.selectedList[widget.index]['id'],
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
    });
    print('berhasil!');
  }

  @override
  void initState() {
    controllerNama = new TextEditingController(
        text: widget.selectedList[widget.index]['nama']);
    controllerNIK = new TextEditingController(
        text: widget.selectedList[widget.index]['nik']);
    controllerTempat = new TextEditingController(
        text: widget.selectedList[widget.index]['tempat_lahir']);
    controllerTanggal = new TextEditingController(
        text: widget.selectedList[widget.index]['tgl_lahir']);
    controllerKelamin = new TextEditingController(
        text: widget.selectedList[widget.index]['jenis_kelamin']);
    controllerAgama = new TextEditingController(
        text: widget.selectedList[widget.index]['agama']);
    controllerAlamat = new TextEditingController(
        text: widget.selectedList[widget.index]['alamat']);
    controllerWali = new TextEditingController(
        text: widget.selectedList[widget.index]['wali']);
    controllerKesehatan = new TextEditingController(
        text: widget.selectedList[widget.index]['kesehatan']);
    controllerPendidikan = new TextEditingController(
        text: widget.selectedList[widget.index]['pendidikan']);
    controllerEkonomi = new TextEditingController(
        text: widget.selectedList[widget.index]['ekonomi']);

    super.initState();
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
          maxLength: 16,
          controller: cont,
          autofocus: false,
          cursorColor: colorMainPurple,
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          style: TextStyle(
            color: colorSecondPurple,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          decoration: InputDecoration(
            counterText: '',
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
              controllerKelamin.text = newValueSelected;
            });
          },
          value: controllerKelamin.text,
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
              controllerKesehatan.text = newValueSelected;
            });
          },
          value: controllerKesehatan.text,
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
              controllerPendidikan.text = newValueSelected;
            });
          },
          value: controllerPendidikan.text,
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
              controllerEkonomi.text = newValueSelected;
            });
          },
          value: controllerEkonomi.text,
        ),
      );
    }

    Widget buttonUbah() {
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
                _checkForm();
                if (berhasil == false) {
                  Navigator.pop(context);
                } else if (berhasil == true) {
                  editDataAnak();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RootDaerah(selectedScreen: 'anak'),
                      ));
                }
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
        appBar: appBarTitle('Ubah Data'),
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
                spasiBaris(2.0),
                alertGagal(),
                spasiBaris(6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonUbah(),
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
