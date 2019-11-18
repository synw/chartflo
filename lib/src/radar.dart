import 'package:flutter/material.dart';
import 'package:ml_linalg/vector.dart';
import 'package:multi_charts/multi_charts.dart' as radar;

class _RadarChartState extends State<RadarChart> {
  _RadarChartState(
      {@required this.dataset,
      this.textColor,
      this.lineColor,
      this.areaColor,
      this.animationDuration,
      this.labelWidth}) {
    _buildDataset();
    _animate = animationDuration > 0;
    _maxValue = Vector.fromList(dataset.values.toList()).max();
  }
  final Map<String, double> dataset;
  final Color textColor;
  final Color lineColor;
  final Color areaColor;
  final int animationDuration;
  final double labelWidth;

  final List<double> _data = [];
  final List<String> _labels = [];
  bool _animate;
  double _maxValue;

  void _buildDataset() {
    dataset.forEach((k, v) {
      _data.add(v);
      _labels.add(k);
    });
  }

  @override
  Widget build(BuildContext context) {
    return radar.RadarChart(
      values: dataset.values.toList(),
      maxValue: _maxValue,
      labels: dataset.keys.toList(),
      animate: _animate,
      animationDuration: Duration(milliseconds: animationDuration),
      strokeColor: lineColor,
      fillColor: areaColor,
      labelColor: textColor,
      labelWidth: labelWidth,
    );
  }
}

/// A radar chart
class RadarChart extends StatefulWidget {
  /// Provide a dataset
  const RadarChart(
      {@required this.dataset,
      this.textColor = Colors.black,
      this.lineColor = Colors.black87,
      this.areaColor = Colors.black26,
      this.labelWidth,
      this.animationDuration = 800});

  /// A map with labels and values
  final Map<String, double> dataset;

  /// Color of the labels
  final Color textColor;

  /// Color of the outline
  final Color lineColor;

  /// Color of the inner area
  final Color areaColor;

  /// Animation duration: set to 0 for no animation
  final int animationDuration;

  /// Override the default labels width
  final double labelWidth;

  @override
  _RadarChartState createState() => _RadarChartState(
      dataset: dataset,
      textColor: textColor,
      lineColor: lineColor,
      areaColor: areaColor,
      labelWidth: labelWidth,
      animationDuration: animationDuration);
}
