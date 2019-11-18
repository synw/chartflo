import 'dart:async';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../models/chart_datapoint.dart';
import 'build_tschart.dart';

class _RealTimeTimeSeriesChartState extends State<RealTimeTimeSeriesChart> {
  _RealTimeTimeSeriesChartState(
      {@required this.dataStream,
      this.initialDataset = const <DateTime, num>{},
      this.showPoints = false,
      this.showArea = false,
      this.showLine = true,
      this.textColor = Colors.black,
      this.fontSize = 14,
      this.lineColor = Colors.blue,
      this.axisColor = Colors.grey,
      this.maxDataPoint})
      : assert(dataStream != null);

  final Color textColor;

  final Color axisColor;

  final int fontSize;

  final Stream<Map<DateTime, num>> dataStream;

  final Map<DateTime, num> initialDataset;

  final bool showPoints;

  final bool showArea;

  final bool showLine;

  final Color lineColor;

  final int maxDataPoint;

  final _seriesList = <charts.Series<dynamic, DateTime>>[];
  final _dataPoints = <ChartDataPoint<DateTime, num>>[];
  bool _ready = false;
  StreamSubscription<Map<DateTime, num>> _sub;

  @override
  void initState() {
    // print("DATASET $dataset");
    super.initState();
    // set data stream listener
    _sub = dataStream.listen((dataPoints) {
      setState(() {
        if (maxDataPoint != null) {
          if (_dataPoints.length >= maxDataPoint) {
            _dataPoints.removeAt(0);
          }
        }
        _seriesList[0] = addDataPoints(dataPoints);
      });
    });
    // set initial data
    initialDataset.forEach((date, val) {
      _dataPoints.add(ChartDataPoint<DateTime, num>(x: date, y: val));
    });
    _seriesList.add(charts.Series<ChartDataPoint<DateTime, num>, DateTime>(
      id: "1",
      //seriesColor: lineColor,
      domainFn: (ChartDataPoint<DateTime, num> dataPoint, _) => dataPoint.x,
      measureFn: (ChartDataPoint<DateTime, num> dataPoint, _) => dataPoint.y,
      data: _dataPoints,
    ));
    setState(() => _ready = true);
  }

  charts.Series<ChartDataPoint<DateTime, num>, DateTime> addDataPoints(
      Map<DateTime, num> dataPoints) {
    final l = <charts.Series<dynamic, DateTime>>[];
    dataPoints.forEach((date, val) =>
        _dataPoints.add(ChartDataPoint<DateTime, num>(x: date, y: val)));
    return charts.Series<ChartDataPoint<DateTime, num>, DateTime>(
      id: "1",
      //seriesColor: lineColor,
      domainFn: (ChartDataPoint<DateTime, num> dataPoint, _) => dataPoint.x,
      measureFn: (ChartDataPoint<DateTime, num> dataPoint, _) => dataPoint.y,
      data: _dataPoints,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ready
        ? buildFcTimeriesChart(_seriesList, fontSize, textColor, lineColor,
            axisColor, showPoints, showArea, showLine, false)
        : const Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

/// A timeseries line chart
class RealTimeTimeSeriesChart extends StatefulWidget {
  /// Provide a dataset
  const RealTimeTimeSeriesChart(
      {@required this.dataStream,
      this.initialDataset = const <DateTime, num>{},
      this.showPoints = false,
      this.showArea = false,
      this.showLine = true,
      this.textColor = Colors.black,
      this.fontSize = 14,
      this.lineColor = Colors.blue,
      this.axisColor = Colors.black,
      this.maxDataPoint});

  /// The dataset to chart
  final Map<DateTime, num> initialDataset;

  /// Show the points on the chart
  final bool showPoints;

  /// Show the area of the chart
  final bool showArea;

  /// Show the line
  final bool showLine;

  /// The datastream
  final Stream<Map<DateTime, num>> dataStream;

  /// The text labels color
  final Color textColor;

  /// The line color
  final Color lineColor;

  /// The axis line color
  final Color axisColor;

  /// The text label font size in poits
  final int fontSize;

  /// Limit to a number of datapoints
  final int maxDataPoint;

  @override
  _RealTimeTimeSeriesChartState createState() => _RealTimeTimeSeriesChartState(
      initialDataset: initialDataset,
      dataStream: dataStream,
      showPoints: showPoints,
      showArea: showArea,
      showLine: showLine,
      textColor: textColor,
      fontSize: fontSize,
      lineColor: lineColor,
      axisColor: axisColor,
      maxDataPoint: maxDataPoint);
}
