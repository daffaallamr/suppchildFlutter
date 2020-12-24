import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/homePage/cabang_chart.dart';
import 'package:suppchild_ver_1/homePage/total_chart.dart';
import 'package:suppchild_ver_1/homePage/fotoSlideShow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

Widget titleChart(title) {
  return Text(
    '$title',
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: SizeConfig.safeBlockHorizontal * 6,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.6,
      color: colorMainPurple,
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List Foto
  int _currentIndex = 0;
  List cardList = [
    Item1(),
    Item2(),
    Item3(),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget slideShow() {
    return CarouselSlider(
      options: CarouselOptions(
        height: SizeConfig.safeBlockVertical * 30,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 12),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: cardList.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.blueAccent,
              child: card,
            ),
          );
        });
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Column(
        children: <Widget>[
          spasiBaris(2.0),
          slideShow(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(cardList, (index, url) {
              return Container(
                height: SizeConfig.safeBlockVertical * 1.25,
                width: SizeConfig.safeBlockHorizontal * 3.5,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }),
          ),
          spasiBaris(4.0),
          titleChart('Total Anak Binaan'),
          spasiBaris(2.0),
          Container(
            height: SizeConfig.safeBlockVertical * 65,
            width: SizeConfig.safeBlockHorizontal * 70,
            margin: const EdgeInsets.all(10.0),
            child: EndPointsAxisTimeSeriesChart.withSampleData(),
          ),
          spasiBaris(8.0),
          titleChart('Anak Binaan Cabang'),
          spasiBaris(2.0),
          Container(
            height: SizeConfig.safeBlockVertical * 65,
            width: SizeConfig.safeBlockHorizontal * 70,
            margin: const EdgeInsets.all(10.0),
            child: GroupedBarChart.withSampleData(),
          ),
          spasiBaris(6.0),
        ],
      ),
    );
  }
}
