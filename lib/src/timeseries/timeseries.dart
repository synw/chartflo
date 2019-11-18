import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../models/chart_datapoint.dart';
import '../models/resample.dart';
import 'build_tschart.dart';
import 'timeframe.dart';

class _TimeSerieChartState extends State<TimeSerieChart> {
  _TimeSerieChartState(
      {@required this.dataset,
      this.showPoints = false,
      this.showArea = false,
      this.showLine = true,
      this.resample,
      this.textColor = Colors.black,
      this.fontSize = 14,
      this.lineColor = Colors.blue,
      this.axisColor = Colors.grey})
      : assert(dataset != null),
        assert(dataset.length > 1),
        _dataset = dataset;

  final Color textColor;

  final Color axisColor;

  final int fontSize;

  final Resample resample;

  final Map<DateTime, num> dataset;

  final bool showPoints;

  final bool showArea;

  final bool showLine;

  final Color lineColor;

  final _dataPoints = <ChartDataPoint<DateTime, num>>[];
  final _seriesList = <charts.Series<dynamic, DateTime>>[];
  Map<DateTime, num> _dataset;
  bool _ready = false;

  @override
  void initState() {
    // print("DATASET $dataset");
    super.initState();
    if (resample != null) {
      _dataset = TimeFrame.resample(
          dataset: dataset,
          resampleMethod: resample.method,
          timePeriod: resample.timePeriod);
    }
    _dataset.forEach((date, val) {
      _dataPoints.add(ChartDataPoint<DateTime, num>(x: date, y: val));
    });
    _seriesList.addAll([
      charts.Series<ChartDataPoint<DateTime, num>, DateTime>(
        id: "1",
        //seriesColor: lineColor,
        domainFn: (ChartDataPoint<DateTime, num> dataPoint, _) => dataPoint.x,
        measureFn: (ChartDataPoint<DateTime, num> dataPoint, _) => dataPoint.y,
        data: _dataPoints,
      )
    ]);
    setState(() => _ready = true);
  }

  @override
  Widget build(BuildContext context) {
    return _ready
        ? buildFcTimeriesChart(_seriesList, fontSize, textColor, lineColor,
            axisColor, showPoints, showArea, showLine, true)
        : const Center(child: CircularProgressIndicator());
  }
}

/// A timeseries line chart
class TimeSerieChart extends StatefulWidget {
  /// Provide a dataset
  const TimeSerieChart(
      {@required this.dataset,
      this.showPoints = false,
      this.showArea = false,
      this.showLine = true,
      this.resample,
      this.textColor = Colors.black,
      this.fontSize = 14,
      this.lineColor = Colors.blue,
      this.axisColor = Colors.black});

  /// The dataset to chart
  final Map<DateTime, num> dataset;

  /// Show the points on the chart
  final bool showPoints;

  /// Show the area of the chart
  final bool showArea;

  /// Show the line
  final bool showLine;

  /// Resample method
  final Resample resample;

  /// The text labels color
  final Color textColor;

  /// The line color
  final Color lineColor;

  /// The axis line color
  final Color axisColor;

  /// The text label font size in poits
  final int fontSize;

  @override
  _TimeSerieChartState createState() => _TimeSerieChartState(
      dataset: dataset,
      showPoints: showPoints,
      showArea: showArea,
      showLine: showLine,
      textColor: textColor,
      fontSize: fontSize,
      lineColor: lineColor,
      axisColor: axisColor,
      resample: resample);
}
