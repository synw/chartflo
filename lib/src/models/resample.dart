import 'package:flutter/foundation.dart';
import '../types.dart';

/// A resample definition
class Resample {
  /// Default constructor
  Resample({@required this.timePeriod, this.method = ResampleMethod.mean});

  /// The resample method: mean or sum
  final ResampleMethod method;

  /// The time period to resample to
  final Duration timePeriod;
}
