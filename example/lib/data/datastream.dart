import 'dart:async';
import 'dart:io';

import 'package:df/df.dart';
import 'package:pedantic/pedantic.dart';

/*Future<void> main() async {
  final ds = DataStreamer();
  await ds.loadDataFrame();
  unawaited(ds.run());
  ds.dataStream.listen(print);
}*/

class DataStreamer {
  DataFrame df;

  final StreamController<Map<DateTime, num>> _streamController =
      StreamController<Map<DateTime, num>>.broadcast();
  bool _run = false;
  int _index = 0;

  Stream<Map<DateTime, num>> get dataStream => _streamController.stream;

  Future<void> run() async {
    print("Running data stream");
    _run = true;
    for (final row in df.subset(_index, df.length)) {
      final date = row["Date"] as DateTime;
      final n = row["Close"] as num;
      final dp = <DateTime, num>{date: n};
      _streamController.sink.add(dp);
      ++_index;
      if (_run == false) {
        return;
      }
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  void pause() => _run = false;

  Future<DataFrame> loadDataFrame() async {
    final d = Directory(".");
    print("DIR ${d.path}");
    print("CUR ${Directory.current}");
    // The data is from http://www.cryptodatadownload.com
    df = await DataFrame.fromCsv("data/btc.csv");
    print("Loaded stock data:");
    df
      ..show()
      ..cols();
    return df;
  }

  void dispose() => _streamController.close();
}
