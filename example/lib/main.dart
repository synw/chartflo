import 'package:flutter/material.dart';

import 'index.dart';
import 'pages/radar.dart';
import 'pages/resample.dart';
import 'pages/simple.dart';
import 'pages/sparkline.dart';

void main() => runApp(MyApp());

final Map<String, StatelessWidget Function(BuildContext)> routes = {
  '/': (BuildContext context) => PageIndex(),
  '/simple': (BuildContext context) => SimpleChartPage(),
  '/resample': (BuildContext context) => ResampleChartPage(),
  '/sparkline': (BuildContext context) => SparklinePage(),
  '/radar': (BuildContext context) => RadarChartPage(),
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
