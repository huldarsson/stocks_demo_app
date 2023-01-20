import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:stocks_demo_app/repositories/stocks_repository.dart';
import 'package:stocks_demo_app/views/stock/bloc/stock_bloc.dart';
import 'package:stocks_demo_app/views/stock/stock_body.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({
    required this.stock,
    super.key,
  });
  final DetailedStockModel stock;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockBloc(
        stocksRepository: context.read<StocksRepository>(),
      )..add(
          LoadStock(stock: stock),
        ),
      child: const Scaffold(
        body: StockBody(),
      ),
    );
  }
}
