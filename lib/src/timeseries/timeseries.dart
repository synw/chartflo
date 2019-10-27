import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../colors.dart';
import '../models.dart';
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
        _dataset = dataset {
    _textColor = getColorForFlutterCharts(textColor);
    _lineColor = getColorForFlutterCharts(lineColor);
    _axisColor = getColorForFlutterCharts(axisColor);
  }

  final Map<DateTime, num> dataset;

  final bool showPoints;

  final bool showArea;

  final bool showLine;

  final Resample resample;

  final Color textColor;

  final Color lineColor;

  final Color axisColor;

  final int fontSize;

  charts.Color _textColor;
  charts.Color _lineColor;
  charts.Color _axisColor;

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
        /*colorFn: (dataPoint, __) {
          var c = _lineColor;
          if (dataPoint.y > 4) {
            c = charts.MaterialPalette.red.shadeDefault;
          }
          return c;
        },*/
        seriesColor: _lineColor,
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
        ? charts.TimeSeriesChart(
            _seriesList,
            domainAxis: charts.DateTimeAxisSpec(
                renderSpec: charts.SmallTickRendererSpec(
                    labelStyle: charts.TextStyleSpec(
                        fontSize: fontSize, // size in Pts.
                        color: _textColor),
                    lineStyle: charts.LineStyleSpec(color: _axisColor))),
            primaryMeasureAxis: charts.NumericAxisSpec(
                renderSpec: charts.SmallTickRendererSpec(
                    labelStyle: charts.TextStyleSpec(
                        fontSize: fontSize, // size in Pts.
                        color: _textColor),
                    lineStyle: charts.LineStyleSpec(color: _axisColor)),
                tickProviderSpec: const charts.BasicNumericTickProviderSpec(
                    desiredMinTickCount: 3, zeroBound: false)),
            animate: true,
            defaultRenderer: charts.LineRendererConfig(
                includePoints: showPoints,
                includeArea: showArea,
                includeLine: showLine),
            dateTimeFactory: const charts.LocalDateTimeFactory(),
          )
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
