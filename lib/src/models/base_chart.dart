import 'package:flutter/material.dart';

/// A base class for a chart
class BaseChart {
  /// The dataset
  Map<DateTime, num> dataset;

  /// The labels text color
  Color textColor;

  /// The axis lines color
  Color axisColor;

  /// The font size for labels
  int fontSize;
}
