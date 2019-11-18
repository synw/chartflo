import 'package:flutter/material.dart';
import 'package:chartflo/chartflo.dart';
import '../data/generate.dart';

/// Charts with resampled data
class ResampleChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dataset ??= generateData();
    return Column(children: <Widget>[
      const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("One day mean", textScaleFactor: 1.8)),
      Container(
          height: 150.0,
          width: 500.0,
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
        width: 500.0,
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
          width: 500.0,
          child: TimeSerieChart(
            dataset: dataset,
            showPoints: true,
            showArea: true,
            resample: Resample(timePeriod: const Duration(days: 3)),
          )),
    ]);
  }
}
