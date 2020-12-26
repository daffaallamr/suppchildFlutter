import 'package:flutter/material.dart';
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
      fontWeight: FontWeight.w600,
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
            width: SizeConfig.safeBlockHorizontal * 80,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.white,
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
                height: SizeConfig.safeBlockVertical * 1.1,
                width: SizeConfig.safeBlockHorizontal * 3.25,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? colorSecondPurple : Colors.grey,
                ),
              );
            }),
          ),
          spasiBaris(8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleChart('Total Anak Binaan'),
              spasiBaris(2.0),
              Container(
                height: SizeConfig.safeBlockVertical * 65,
                width: SizeConfig.safeBlockHorizontal * 85,
                child: Card(
                    color: Colors.grey[100],
                    elevation: 4.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: EndPointsAxisTimeSeriesChart.withSampleData(),
                    )),
              ),
            ],
          ),
          spasiBaris(10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleChart('Anak Binaan Cabang'),
              spasiBaris(2.0),
              Container(
                height: SizeConfig.safeBlockVertical * 65,
                width: SizeConfig.safeBlockHorizontal * 85,
                child: Card(
                    color: Colors.grey[100],
                    elevation: 4.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GroupedBarChart.withSampleData(),
                    )),
              ),
            ],
          ),
          spasiBaris(6.0),
        ],
      ),
    );
  }
}
