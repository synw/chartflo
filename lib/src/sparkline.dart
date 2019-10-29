import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:ml_linalg/linalg.dart';

/// A sparkline chart
class SparklineChart extends StatelessWidget {
  /// Default constructor
  SparklineChart(
      {@required this.dataset,
      this.lineColor = Colors.blue,
      this.areaColor,
      this.lineWidth = 3.0,
      this.lineGradientColors,
      this.lineGradientTriggerValue = 0,
      Key key})
      : _max = (dataset.length > 1) ? Vector.fromList(dataset).max() : 0,
        super(key: key);

  /// The chart dataset
  final List<double> dataset;

  /// The line color
  final Color lineColor;

  /// The line width
  final double lineWidth;

  /// The area color
  final Color areaColor;

  /// Line gradient colors to apply
  final List<Color> lineGradientColors;

  /// Value from where the linear gradient appears
  final double lineGradientTriggerValue;

  final double _max;

  @override
  Widget build(BuildContext context) {
    if (dataset.isEmpty) {
      return const Text("");
    }
    Widget w;
    if (lineGradientColors != null && _max > lineGradientTriggerValue) {
      w = Sparkline(
        lineColor: lineColor,
        data: dataset,
        fillMode: FillMode.below,
        fillColor: (areaColor != null) ? areaColor : Colors.transparent,
        lineWidth: lineWidth,
        lineGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: lineGradientColors,
        ),
      );
    } else {
      w = Sparkline(
          lineColor: lineColor,
          data: dataset,
          fillMode: FillMode.below,
          fillColor: (areaColor != null) ? areaColor : Colors.transparent,
          lineWidth: lineWidth);
    }
    return w;
  }
}
