import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';

class StockListTileLeading extends StatelessWidget {
  const StockListTileLeading({
    required this.stock,
    super.key,
  });

  final DetailedStockModel stock;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stock.symbol,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          stock.name,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
