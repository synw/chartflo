import 'package:flutter/material.dart';
import 'package:chartflo/chartflo.dart';
import '../data.dart';

/// Simple charts
class SimpleChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Simple")),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Simple",
                  textScaleFactor: 1.8,
                ),
              ),
              Container(
                height: 200.0,
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
            ])));
  }
}
