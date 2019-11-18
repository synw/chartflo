import 'package:chartflo/chartflo.dart';
import 'package:flutter/material.dart';

import '../data/generate.dart';

/// Simple charts
class SimpleChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dataset ??= generateData();
    return Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Basic", textScaleFactor: 1.8),
      ),
      Container(
        height: 200.0,
        width: 500.0,
        child: TimeSerieChart(
          dataset: dataset,
          showArea: true,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("With options", textScaleFactor: 1.8),
      ),
      Container(
        color: Colors.black,
        height: 200.0,
        width: 500.0,
        child: TimeSerieChart(
          dataset: dataset,
          lineColor: Colors.red,
          textColor: Colors.white,
          axisColor: Colors.white,
          showPoints: true,
          showLine: false,
          fontSize: 18,
        ),
      ),
    ]));
  }
}
