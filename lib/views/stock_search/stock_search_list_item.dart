import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/stock_model.dart';

class StockSearchListItem extends StatelessWidget {
  const StockSearchListItem({
    required this.stock,
    required this.onPressed,
    super.key,
  });

  final StockModel stock;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(stock.symbol),
      subtitle: Text(stock.name),
      onTap: onPressed,
    );
  }
}
