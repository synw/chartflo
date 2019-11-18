import 'package:flutter/widgets.dart';
import 'package:desktopia/desktopia.dart';
import 'main.dart';
import 'sidebar.dart';

const _emptyWidget = Text("");

final appZones = <AppZone>[
  AppZone("main", MainZone()),
  AppZone("sidebar", Sidebar()),
  AppZone("status", _emptyWidget),
];
