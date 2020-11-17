import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:suppchild_ver_1/constant.dart';

class GroupedButton extends StatelessWidget {
  const GroupedButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grouped Button Example'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Radio Button'),
        onPressed: () {

        },
        icon: Icon(Icons.radio_button_checked),
      ),
      body: Container(
        child: CustomRadioButton(
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
        ),
            ),
    );
  }
}