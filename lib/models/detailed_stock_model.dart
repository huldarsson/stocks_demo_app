import 'package:stocks_demo_app/models/price_model.dart';

class DetailedStockModel {
  final String symbol;
  final String name;
  final String description;
  final String currency;
  final String sector;
  final String industry;
  final int marketCap;
  final PriceModel? price;

  DetailedStockModel({
    required this.symbol,
    required this.name,
    required this.description,
    required this.currency,
    required this.sector,
    required this.industry,
    required this.marketCap,
    this.price,
  });

  DetailedStockModel copyWith({
    String? symbol,
    String? name,
    String? description,
    String? currency,
    String? sector,
    String? industry,
    int? marketCap,
    PriceModel? price,
  }) {
    return DetailedStockModel(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      description: description ?? this.description,
      currency: currency ?? this.currency,
      sector: sector ?? this.sector,
      industry: industry ?? this.industry,
      marketCap: marketCap ?? this.marketCap,
      price: price ?? this.price,
    );
  }
}
