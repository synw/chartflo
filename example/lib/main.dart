import 'package:flutter/material.dart';

import 'charts/resample.dart';
import 'charts/simple.dart';
import 'data.dart';
import 'index.dart';

void main() {
  runApp(MyApp());
  dataset = generateData();
}

final Map<String, StatelessWidget Function(BuildContext)> routes = {
  '/': (BuildContext context) => PageIndex(),
  '/simple': (BuildContext context) => SimpleChartPage(),
  '/resample': (BuildContext context) => ResampleChartPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chartflo example',
      routes: routes,
    );
  }
}
