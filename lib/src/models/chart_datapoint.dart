import 'package:flutter/foundation.dart';

/// A datapoint for chart with x and y values
class ChartDataPoint<X, Y> {
  /// Provide x and y
  ChartDataPoint({@required this.x, @required this.y});

  /// The x axis value
  final X x;

  /// The y axis value
  final Y y;
}
