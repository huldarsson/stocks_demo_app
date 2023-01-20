import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/models/stock_model.dart';
import 'package:stocks_demo_app/repositories/stocks_repository.dart';
import 'package:stocks_demo_app/views/stock_search/bloc/stock_search_bloc.dart';
import 'package:stocks_demo_app/views/stock_search/stock_search_content.dart';

class StockSearchDialog extends StatelessWidget {
  const StockSearchDialog({
    required this.onStockSelected,
    super.key,
  });

  final void Function(StockModel) onStockSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockSearchBloc(
        stocksRepository: context.read<StocksRepository>(),
      ),
      child: AlertDialog(
        content: StockSearchContent(
          onStockSelected: onStockSelected,
        ),
      ),
    );
  }
}
