class DataPointModel {
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;
  final DateTime date;

  DataPointModel({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.date,
  });
}
