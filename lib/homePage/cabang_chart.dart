/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [new charts.SeriesLegend()],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    //Laki-laki
    final desktopSalesData = [
      new OrdinalSales('GRK', 5),
      new OrdinalSales('BKL', 8),
      new OrdinalSales('MJK', 11),
      new OrdinalSales('SBY', 10),
      new OrdinalSales('SDA', 14),
      new OrdinalSales('LMG', 6),
    ];

    //Perempuan
    final tableSalesData = [
      new OrdinalSales('GRK', 8),
      new OrdinalSales('BKL', 12),
      new OrdinalSales('MJK', 6),
      new OrdinalSales('SBY', 14),
      new OrdinalSales('SDA', 7),
      new OrdinalSales('LMG', 15),
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

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}