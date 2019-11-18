import 'package:flutter/material.dart';

import '../charts/sparkline.dart';

/// Simple charts
class SparklinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Resample")),
        body: Padding(padding: const EdgeInsets.all(10.0), child: Sparkline()));
  }
}
