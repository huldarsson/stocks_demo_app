import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/api/stocks/alphavantage_stocks_api.dart';
import 'package:stocks_demo_app/api/storage/local_storage_api.dart';
import 'package:stocks_demo_app/repositories/stocks_repository.dart';
import 'package:stocks_demo_app/views/stocks/bloc/stocks_bloc.dart';
import 'package:stocks_demo_app/views/stocks/stocks_screen.dart';

void main() {
  runApp(StocksApp(
    stocksRepository: StocksRepository(
      stocksApi: AlphavantageStocksApi(),
      storageApi: LocalStorageApi(),
    ),
  ));
}

class StocksApp extends StatelessWidget {
  const StocksApp({
    super.key,
    required this.stocksRepository,
  });

  final StocksRepository stocksRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => stocksRepository,
      child: BlocProvider(
        create: (context) => StocksBloc(
          stocksRepository: stocksRepository,
        )..add(
            LoadStocks(),
          ),
        child: MaterialApp(
          title: 'Stocks',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const StocksScreen(),
        ),
      ),
    );
  }
}
