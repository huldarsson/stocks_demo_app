import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';

class StockListTileTrailing extends StatelessWidget {
  const StockListTileTrailing({
    required this.stock,
    super.key,
  });

  final DetailedStockModel stock;

  @override
  Widget build(BuildContext context) {
    if (stock.price == null) return const SizedBox.shrink();
    bool isUp = stock.price!.change > 0;
    Color color = isUp ? Colors.green[400]! : Colors.red[400]!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isUp
            ? Icon(
                Icons.arrow_upward_rounded,
                color: color,
              )
            : Icon(
                Icons.arrow_downward_outlined,
                color: color,
              ),
        const SizedBox(
          width: 10,
        ),
        Text(
          stock.price!.changePercentage,
          style: TextStyle(
            fontSize: 20,
            color: color,
          ),
        )
      ],
    );
  }
}
