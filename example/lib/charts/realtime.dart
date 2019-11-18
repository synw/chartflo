import 'package:chartflo/chartflo.dart';
import 'package:flutter/material.dart';
import 'package:pad/pad.dart';
import 'package:pedantic/pedantic.dart';

import '../data/datastream.dart';

class _RealTimeChartState extends State<RealTimeChart> {
  Map<DateTime, num> initialDataset = <DateTime, num>{};
  bool ready = false;

  Future<void> loadData() async {
    if (!ds.hasData) {
      await ds.loadDataFrame();
    }
    // set initial dataset
    final df2 = ds.df.subset_(0, 1500);
    df2.rows.forEach((row) {
      initialDataset[row["date"] as DateTime] = row["close"] as double;
    });
    // start the data feed
    unawaited(ds.run(index: 1501));
    ds.dataStream.listen(print);
  }

  @override
  void initState() {
    super.initState();
    loadData().then((_) => setState(() => ready = true));
  }

  @override
  Widget build(BuildContext context) {
    return ready
        ? Column(
            children: <Widget>[
              const PadVertical(10.0,
                  child: Text("Real time chart", textScaleFactor: 1.8)),
              Container(
                  width: 450,
                  height: 250,
                  child: RealTimeTimeSeriesChart(
                      dataStream: ds.dataStream,
                      initialDataset: initialDataset)),
              const PadVertical(10.0,
                  child: Text("Ticker", textScaleFactor: 1.8)),
              Container(
                  width: 450,
                  height: 250,
                  child: RealTimeTimeSeriesChart(
                      dataStream: ds.dataStream,
                      showArea: true,
                      showPoints: true,
                      maxDataPoint: 50)),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class RealTimeChart extends StatefulWidget {
  @override
  _RealTimeChartState createState() => _RealTimeChartState();
}
