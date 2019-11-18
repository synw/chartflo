import 'dart:math';

import 'package:flutter/material.dart';
import 'package:chartflo/chartflo.dart';

final Random rnd = Random();

class _RadarChartExampleState extends State<RadarChartExample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: RadarChart(
          dataset: <String, double>{
            "one": 16.2,
            "two": 8.3,
            "three": 11.7,
            "four": 6.7,
            "five": 12.1,
          },
          lineColor: Colors.blueGrey,
          textColor: Colors.black,
          areaColor: Colors.green,
          labelWidth: 120.0,
          animationDuration: 0,
        ));
  }
}

class RadarChartExample extends StatefulWidget {
  @override
  _RadarChartExampleState createState() => _RadarChartExampleState();
}
