import 'package:flutter/foundation.dart';

/// A datapoint for chart with x and y values
class ChartDataPoint<X, Y> {
  /// Provide x and y
  ChartDataPoint({@required this.x, @required this.y});

  final X x;
  final Y y;
}

/// The resample method
enum ResampleMethod {
  /// sum method
  sum,

  /// mean method
  mean
}

/// A resample definition
class Resample {
  /// Default constructor
  Resample({@required this.timePeriod, this.method = ResampleMethod.mean});

  /// The resample method: mean or sum
  final ResampleMethod method;

  /// The time period to resample to
  final Duration timePeriod;
}
