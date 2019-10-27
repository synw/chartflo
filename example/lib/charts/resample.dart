import 'package:flutter/material.dart';
import 'package:chartflo/chartflo.dart';
import '../data.dart';

/// Charts with resampled data
class ResampleChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Resample")),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: <Widget>[
              const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("One day mean", textScaleFactor: 1.8)),
              Container(
                  height: 150.0,
                  child: TimeSerieChart(
                    dataset: dataset,
                    showPoints: true,
                    showArea: true,
                    resample: Resample(timePeriod: const Duration(days: 1)),
                  )),
              const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("One day sum", textScaleFactor: 1.8)),
              Container(
                height: 150.0,
                child: TimeSerieChart(
                    dataset: dataset,
                    showPoints: true,
                    showArea: true,
                    resample: Resample(
                        timePeriod: const Duration(days: 1),
                        method: ResampleMethod.sum)),
              ),
              const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("3 days mean", textScaleFactor: 1.8)),
              Container(
                  height: 150.0,
                  child: TimeSerieChart(
                    dataset: dataset,
                    showPoints: true,
                    showArea: true,
                    resample: Resample(timePeriod: const Duration(days: 3)),
                  )),
            ])));
  }
}
