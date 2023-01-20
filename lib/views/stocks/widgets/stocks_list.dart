import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:stocks_demo_app/views/stocks/widgets/stock_list_tile.dart';

class StocksList extends StatelessWidget {
  const StocksList({
    required this.stocks,
    super.key,
  });

  final List<DetailedStockModel> stocks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 60,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      itemBuilder: (context, i) => StockListTile(stock: stocks[i]),
      separatorBuilder: (context, i) => const SizedBox(height: 20),
      itemCount: stocks.length,
    );
  }
}
