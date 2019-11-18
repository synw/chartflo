import 'package:flutter/material.dart';

import '../charts/simple.dart';

/// Simple charts
class SimpleChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Simple")),
        body:
            Padding(padding: const EdgeInsets.all(10.0), child: SimpleChart()));
  }
}
