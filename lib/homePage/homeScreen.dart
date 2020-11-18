import 'package:flutter/material.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/homePage/cabang_chart.dart';
import 'package:suppchild_ver_1/homePage/total_chart.dart';
import 'package:suppchild_ver_1/homePage/fotoSlideShow.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget titleChart(title) {
  return Text(
    '$title',
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 20,
      fontWeight: FontWeight.w900,
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
  int _currentIndex=0;
  List cardList=[
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

  Widget SlideShow () {
    return CarouselSlider(
      options: CarouselOptions(
        height: 235.0,
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
      items: cardList.map((card){
        return Builder(
            builder:(BuildContext context){
              return Container(
                height: MediaQuery.of(context).size.height*0.30,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.blueAccent,
                  child: card,
                ),
              );
            }
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            spasiBaris(20.0),
            SlideShow(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                  ),
                );
              }),
            ),
            spasiBaris(20.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
              child: titleChart('Anak Binaan Cabang'),
            ),
            spasiBaris(20.0),
            Container(
              height: 400,
              width: 350,
              margin: const EdgeInsets.all(10.0),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.redAccent)
              // ),
              child: GroupedBarChart.withSampleData(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: titleChart('Total Anak Binaan'),
            ),
            spasiBaris(20.0),
            Container(
              height: 400,
              width: 350,
              margin: const EdgeInsets.all(10.0),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.redAccent)
              // ),
              child: EndPointsAxisTimeSeriesChart.withSampleData(
              ),
            ),
            spasiBaris(20.0),
          ],
        ),
      );
  }
}