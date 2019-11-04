import 'package:chartflo/chartflo.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class SparklinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sparkline")),
      body: Container(
        height: 120.0,
        padding: const EdgeInsets.all(10.0),
        child: SparklineChart(
          dataset: generateFlatData(),
          areaColor: Colors.grey[200],
        ),
      ),
    );
  }
}
