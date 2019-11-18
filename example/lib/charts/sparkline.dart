import 'package:chartflo/chartflo.dart';
import 'package:flutter/material.dart';

import '../data/generate.dart';

class Sparkline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SparklineChart(
      dataset: generateFlatData(),
      areaColor: Colors.grey[200],
    );
  }
}
