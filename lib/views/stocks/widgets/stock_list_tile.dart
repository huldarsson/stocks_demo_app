import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:stocks_demo_app/views/stock/stock_screen.dart';
import 'package:stocks_demo_app/views/stocks/widgets/stock_list_tile_leading.dart';
import 'package:stocks_demo_app/views/stocks/widgets/stock_list_tile_trailing.dart';

class StockListTile extends StatelessWidget {
  const StockListTile({
    required this.stock,
    super.key,
  });

  final DetailedStockModel stock;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StockScreen(stock: stock),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[200]!,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: StockListTileLeading(stock: stock)),
            StockListTileTrailing(stock: stock),
          ],
        ),
      ),
    );
  }
}
