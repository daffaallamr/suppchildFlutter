import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:suppchild_ver_1/main.dart';

class EndPointsAxisTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  EndPointsAxisTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory EndPointsAxisTimeSeriesChart.withSampleData() {
    return new EndPointsAxisTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Configures an axis spec that is configured to render one tick at each
      // end of the axis range, anchored "inside" the axis. The start tick label
      // will be left-aligned with its tick mark, and the end tick label will be
      // right-aligned with its tick mark.
      domainAxis: new charts.EndPointsTimeAxisSpec(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      // new TimeSeriesSales(new DateTime(2018), count2018),
      // new TimeSeriesSales(new DateTime(2019), count2019),
      // new TimeSeriesSales(new DateTime(2020), count2020),
      // new TimeSeriesSales(new DateTime(2021), count2021),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.Color.fromHex(code: '#7B417B'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
