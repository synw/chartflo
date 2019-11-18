import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../colors.dart';

/// Build a timeseries Flutter charts
charts.TimeSeriesChart buildFcTimeriesChart(
  List<charts.Series<dynamic, DateTime>> seriesList,
  int fontSize,
  Color textColor,
  Color lineColor,
  Color axisColor,
  bool showPoints,
  bool showArea,
  bool showLine,
  bool animate,
) {
  final _textColor = getColorForFlutterCharts(textColor);
  final _lineColor = getColorForFlutterCharts(lineColor);
  final _axisColor = getColorForFlutterCharts(axisColor);
  return charts.TimeSeriesChart(
    seriesList,
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
            lineStyle: charts.LineStyleSpec(color: _lineColor)),
        tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            desiredMinTickCount: 3, zeroBound: false)),
    animate: animate,
    defaultRenderer: charts.LineRendererConfig(
        includePoints: showPoints,
        includeArea: showArea,
        includeLine: showLine),
    dateTimeFactory: const charts.LocalDateTimeFactory(),
  );
}
