import 'package:flutter/material.dart';

import '../charts/resample.dart';

class ResampleChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Resample")),
        body: Padding(
            padding: const EdgeInsets.all(10.0), child: ResampleChart()));
  }
}
