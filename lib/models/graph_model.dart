import 'package:stocks_demo_app/models/data_point_model.dart';

enum GraphInterval {
  oneMinute,
  fiveMinutes,
  oneHour,
  twentyFourHours,
}

enum GraphDuration { day, week, month, year, fiveYears, max }

extension GraphIntervalExtension on GraphInterval {
  String get key {
    switch (this) {
      case GraphInterval.oneMinute:
        return '1min';
      case GraphInterval.fiveMinutes:
        return '5min';
      case GraphInterval.oneHour:
        return '60min';
      case GraphInterval.twentyFourHours:
        return '24h';
      default:
        return '5min';
    }
  }
}

class GraphModel {
  final List<DataPointModel> dataPoints;

  GraphModel({
    required this.dataPoints,
  });
}
