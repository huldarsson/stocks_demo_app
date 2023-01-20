import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/models/stock_model.dart';
import 'package:stocks_demo_app/views/stock_search/stock_search_dialog.dart';
import 'package:stocks_demo_app/views/stocks/bloc/stocks_bloc.dart';

class StocksListEmptyWidget extends StatelessWidget {
  const StocksListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: const Key('addStockButton'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => StockSearchDialog(
                  onStockSelected: (StockModel stock) {
                    BlocProvider.of<StocksBloc>(context).add(
                      AddStock(stock: stock),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 15),
          const Text('Add a stock'),
        ],
      ),
    );
  }
}
