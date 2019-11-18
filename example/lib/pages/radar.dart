import 'package:flutter/material.dart';

import '../charts/radar.dart';

class RadarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Simple")),
        body: Padding(
            padding: const EdgeInsets.all(10.0), child: RadarChartExample()));
  }
}
