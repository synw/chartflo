import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Translate a regular Flutter olor to a chart color palette
/// for Flutter charts
///
/// Not all Flutter colors are supported. Supported colors:
///
/// blue, cyan, deepOrange, grey, green, indigo, lime, pink,
/// purple, red, teal, transparent, white, yello
charts.Color getColorForFlutterCharts(Color color) {
  charts.Color c;
  if (color == Colors.blue) {
    c = charts.MaterialPalette.blue.shadeDefault;
  } else if (color == Colors.black) {
    c = charts.MaterialPalette.black;
  } else if (color == Colors.cyan) {
    c = charts.MaterialPalette.cyan.shadeDefault;
  } else if (color == Colors.deepOrange) {
    c = charts.MaterialPalette.deepOrange.shadeDefault;
  } else if (color == Colors.grey) {
    c = charts.MaterialPalette.gray.shadeDefault;
  } else if (color == Colors.green) {
    c = charts.MaterialPalette.green.shadeDefault;
  } else if (color == Colors.indigo) {
    c = charts.MaterialPalette.indigo.shadeDefault;
  } else if (color == Colors.lime) {
    c = charts.MaterialPalette.lime.shadeDefault;
  } else if (color == Colors.pink) {
    c = charts.MaterialPalette.pink.shadeDefault;
  } else if (color == Colors.purple) {
    c = charts.MaterialPalette.purple.shadeDefault;
  } else if (color == Colors.red) {
    c = charts.MaterialPalette.red.shadeDefault;
  } else if (color == Colors.teal) {
    c = charts.MaterialPalette.teal.shadeDefault;
  } else if (color == Colors.transparent) {
    c = charts.MaterialPalette.transparent;
  } else if (color == Colors.white) {
    c = charts.MaterialPalette.white;
  } else if (color == Colors.yellow) {
    c = charts.MaterialPalette.yellow.shadeDefault;
  } else {
    print("Warning, the color $color is not supported in Flutter charts. "
        "Using default color");
    c = charts.MaterialPalette.blue.shadeDefault;
  }
  return c;
}
