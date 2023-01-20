import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/models/stock_model.dart';
import 'package:stocks_demo_app/views/stock_search/stock_search_dialog.dart';
import 'package:stocks_demo_app/views/stocks/bloc/stocks_bloc.dart';
import 'package:stocks_demo_app/views/stocks/stocks_body.dart';

class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StocksBloc, StocksState>(
      builder: (context, state) {
        return Scaffold(
          body: const StocksBody(),
          floatingActionButton:
              state.status.isSuccess && state.stocks.isNotEmpty
                  ? FloatingActionButton(
                      key: const Key('addStockButton'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => StockSearchDialog(
                            onStockSelected: (StockModel stock) {
                              context.read<StocksBloc>().add(
                                    AddStock(stock: stock),
                                  );
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      child: const Icon(Icons.add),
                    )
                  : null,
        );
      },
    );
  }
}
