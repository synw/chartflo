import 'package:chartflo/chartflo.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import '../data/datastream.dart';

class _RealTimeChartState extends State<RealTimeChart> {
  final _ds = DataStreamer();

  Future<void> loadData() async {
    await _ds.loadDataFrame();
    // start the data feed
    unawaited(_ds.run());
    _ds.dataStream.listen(print);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        width: 500.0,
        child: RealTimeTimeSeriesChart(dataStream: _ds.dataStream));
  }
}

class RealTimeChart extends StatefulWidget {
  @override
  _RealTimeChartState createState() => _RealTimeChartState();
}
