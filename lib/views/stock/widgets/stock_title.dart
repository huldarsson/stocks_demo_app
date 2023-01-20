import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';

class StockTitle extends StatelessWidget {
  const StockTitle({
    required this.stock,
    super.key,
  });

  final DetailedStockModel stock;

  @override
  Widget build(BuildContext context) {
    Color color =
        stock.price!.change < 0 ? Colors.red[400]! : Colors.green[400]!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          stock.symbol,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        stock.price != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    stock.price!.change < 0
                        ? Icons.arrow_downward_rounded
                        : Icons.arrow_upward_rounded,
                    color: color,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    stock.price!.changePercentage,
                    style: TextStyle(
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
