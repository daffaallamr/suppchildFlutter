/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:suppchild_ver_1/main.dart';

class GroupedBarChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate});

  factory GroupedBarChart.withSampleData() {
    return new GroupedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  _GroupedBarChartState createState() => _GroupedBarChartState();

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    //Laki-laki
    final desktopSalesData = [
      new OrdinalSales('GRK', gresikL),
      new OrdinalSales('BKL', bangkalanL),
      new OrdinalSales('MJK', mojokertoL),
      new OrdinalSales('SBY', surabayaL),
      new OrdinalSales('SDA', sidoarjoL),
      new OrdinalSales('LMG', lamonganL),
    ];

    //Perempuan
    final tableSalesData = [
      new OrdinalSales('GRK', gresikP),
      new OrdinalSales('BKL', bangkalanP),
      new OrdinalSales('MJK', mojokertoP),
      new OrdinalSales('SBY', surabayaP),
      new OrdinalSales('SDA', sidoarjoP),
      new OrdinalSales('LMG', lamonganP),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Laki - Laki',
        colorFn: (_, __) => charts.Color.fromHex(code: '#7B417B'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Perempuan',
        colorFn: (_, __) => charts.Color.fromHex(code: '#FE8F57'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
    ];
  }
}

class _GroupedBarChartState extends State<GroupedBarChart> {
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      widget.seriesList,
      animate: widget.animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [new charts.SeriesLegend()],
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
