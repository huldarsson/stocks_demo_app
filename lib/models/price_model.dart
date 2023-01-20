class PriceModel {
  final double price;
  final double change;
  final String changePercentage;
  final double open;
  final double high;
  final double low;
  final double previousClose;

  PriceModel({
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.open,
    required this.high,
    required this.low,
    required this.previousClose,
  });

  PriceModel copyWith({
    double? price,
    double? change,
    String? changePercentage,
    double? open,
    double? high,
    double? low,
    double? previousClose,
  }) {
    return PriceModel(
      price: price ?? this.price,
      change: change ?? this.change,
      changePercentage: changePercentage ?? this.changePercentage,
      open: open ?? this.open,
      high: high ?? this.high,
      low: low ?? this.low,
      previousClose: previousClose ?? this.previousClose,
    );
  }
}
