import 'dart:async';
import 'package:desktopia/desktopia.dart';
import 'zones/appzones.dart';

//ConfigManager conf;
final zones = AppZoneStore();

final _readyCompleter = Completer<void>();

Future<void> get onConfReady => _readyCompleter.future;

Future<void> initConf() async {
  //conf = ConfigManager.auto("janus", verbose: true)..read();
  zones.init(appZones);
  _readyCompleter.complete();
}
