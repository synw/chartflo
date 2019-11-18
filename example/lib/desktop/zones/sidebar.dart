import 'package:desktopia/desktopia.dart';
import 'package:flutter/material.dart';
import 'package:pad/pad.dart';

import '../../charts/radar.dart';
import '../../charts/realtime.dart';
import '../../charts/resample.dart';
import '../../charts/simple.dart';
import '../../charts/sparkline.dart';
import '../conf.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DesktopSectionHeader(title: "Timeseries"),
        ListView(shrinkWrap: true, children: <Widget>[
          ListTile(
            title: GestureDetector(
              child: const Text("Simple"),
              onTap: () => zones.update(
                  "main",
                  Row(
                    children: <Widget>[
                      const PadVertical(10.0, child: Text("Simple")),
                      SimpleChart()
                    ],
                  )),
            ),
          ),
          ListTile(
            title: GestureDetector(
              child: const Text("Sparkline"),
              onTap: () => zones.update(
                  "main",
                  Row(
                    children: <Widget>[
                      const PadVertical(10.0, child: Text("Sparkline")),
                      Sparkline()
                    ],
                  )),
            ),
          ),
          ListTile(
            title: GestureDetector(
              child: const Text("Resample"),
              onTap: () => zones.update(
                  "main",
                  Row(
                    children: <Widget>[
                      const PadVertical(10.0, child: Text("Resample")),
                      ResampleChart()
                    ],
                  )),
            ),
          ),
          ListTile(
            title: GestureDetector(
              child: const Text("Real time"),
              onTap: () => zones.update(
                  "main",
                  Row(
                    children: <Widget>[
                      const PadVertical(10.0, child: Text("Real time")),
                      RealTimeChart()
                    ],
                  )),
            ),
          ),
        ]),
        DesktopSectionHeader(title: "Categorical"),
        ListView(shrinkWrap: true, children: <Widget>[
          ListTile(
            title: GestureDetector(
              child: const Text("Radar"),
              onTap: () => zones.update(
                  "main",
                  Row(
                    children: <Widget>[
                      const PadVertical(10.0, child: Text("Radar")),
                      Container(
                          width: 450, height: 450, child: RadarChartExample())
                    ],
                  )),
            ),
          )
        ]),
      ],
    );
  }
}
