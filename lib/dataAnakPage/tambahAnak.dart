import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/constant.dart';

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

Widget formNama() {
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
      child: TextFormField(
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
          hintText: 'Nama Lengkap',
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
Widget formNIK() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
      child: TextFormField(
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
          hintText: 'NIK',
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
Widget formTempat() {
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
      autofocus: false,
      cursorColor: colorMainPurple,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 22,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
        border: InputBorder.none,
        hintText: 'Tempat',
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
Widget formTanggal() {
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
      autofocus: false,
      cursorColor: colorMainPurple,
      keyboardType: TextInputType.datetime,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 22,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 4, 10, 4),
        border: InputBorder.none,
        hintText: 'Tgl Lahir',
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
Widget formAgama() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
      child: TextFormField(
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
          hintText: 'Agama',
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
Widget formAlamat() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
      child: TextFormField(
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
          hintText: 'Alamat',
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
Widget formWali() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
      child: TextFormField(
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
          hintText: 'Wali',
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
Widget formKesehatan() {
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
        hintText: 'Kesehatan',
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
Widget formPendidikan() {
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
        hintText: 'Pendidikan',
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
Widget formEkonomi() {
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
        hintText: 'Ekonomi',
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

class TambahAnak extends StatefulWidget {
  @override
  _TambahAnakState createState() => _TambahAnakState();
}

class _TambahAnakState extends State<TambahAnak> {
  var _currencies = ['-', '1', '2', '3', '4', '5'];
  var _currentItemSelected = '-';

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
            this._currentItemSelected = newValueSelected;
          });
        },
        value: _currentItemSelected,
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
            this._currentItemSelected = newValueSelected;
          });
        },
        value: _currentItemSelected,
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
            this._currentItemSelected = newValueSelected;
          });
        },
        value: _currentItemSelected,
      ),
    );
  }

  Widget buttonTambah() {
    return Center(
      child: Container(
        width: 160,
        child: RaisedButton(
          onPressed: () {
            //Proses
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
            Navigator.pushNamed(context, '/search');
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

  @override
  Widget build(BuildContext context) {
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
                  formNama(),
                  formNIK(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formTempat(),
                        formTanggal(),
                      ],
                    ),
                  ),
                  formAgama(),
                  formAlamat(),
                  formWali(),
                  spasiBaris(40.0),
                  titleForm('Kondisi Anak'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formKesehatan(),
                        dropDownKesehatan(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formPendidikan(),
                        dropDownPendidikan(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        formEkonomi(),
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
