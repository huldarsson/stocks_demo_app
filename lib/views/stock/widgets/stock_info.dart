import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';

class StockInfo extends StatelessWidget {
  const StockInfo({
    required this.stock,
    super.key,
  });

  final DetailedStockModel stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50]!.withGreen(245).withBlue(245).withRed(245),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _infoRow('Name', stock.name),
          _infoRow('Sector', stock.sector),
          _infoRow('Currency', stock.currency),
          _infoRow('Market Cap', stock.marketCap.toString()),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          )
        ],
      ),
    );
  }
}
