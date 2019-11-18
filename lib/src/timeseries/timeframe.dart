import 'package:flutter/foundation.dart';
import 'package:ml_linalg/linalg.dart';
import '../types.dart';

/// A time frame
class TimeFrame {
  /// Populate data to now at a time interval
  static Map<DateTime, num> populateToNow(
      {@required Map<DateTime, num> dataset,
      @required Duration timePeriod,
      num value = 0}) {
    final _d = dataset.keys;
    _d.toList().sort((a, b) => a.compareTo(b));
    var date = _d.last;
    final now = DateTime.now();
    final data = dataset;
    print("DATA START $data");
    while (date.isBefore(now)) {
      date = date.add(timePeriod);
      data[date] = value;
    }
    print("DATA END $data");
    return data;
  }

  /// Resample a dataset by a time period
  static Map<DateTime, num> resample(
      {@required Map<DateTime, num> dataset,
      @required Duration timePeriod,
      ResampleMethod resampleMethod = ResampleMethod.mean}) {
    final ds = <DateTime, num>{};
    _splitFromDuration(dataset, timePeriod).forEach((subSerie) {
      final startDate = subSerie.first.keys.toList().first;
      final endDate = subSerie.last.keys.toList().first;
      // resample numbers
      final row = subSerie
          .map<double>((row) => row[row.keys.toList()[0]].toDouble())
          .toList();
      num value;
      switch (resampleMethod) {
        case ResampleMethod.mean:
          value = Vector.fromList(row).mean();
          break;
        case ResampleMethod.sum:
          value = Vector.fromList(row).sum();
          break;
      }
      final date = _midDate(startDate, endDate);
      ds[date] = value;
    });
    return ds;
  }
}

DateTime _midDate(DateTime startDate, DateTime endDate) {
  final offset = endDate.difference(startDate) ~/ 2;
  return endDate.subtract(offset);
}

List<List<Map<DateTime, num>>> _splitFromDuration(
    Map<DateTime, num> dataset, Duration timePeriod) {
  final res = <List<Map<DateTime, num>>>[];
  final startDate = dataset.keys.toList()[0];
  var nextDate = startDate.add(timePeriod);
  var subSerie = <Map<DateTime, num>>[];
  dataset.forEach((date, value) {
    final record = <DateTime, num>{date: value};
    switch (date.isBefore(nextDate)) {
      case true:
        subSerie.add(record);
        break;
      case false:
        res.add(subSerie);
        subSerie = <Map<DateTime, num>>[record];
        nextDate = date.add(timePeriod);
    }
  });
  return res;
}
