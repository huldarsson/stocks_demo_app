import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:stocks_demo_app/models/stock_model.dart';
import 'package:stocks_demo_app/repositories/stocks_repository.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {
  StocksBloc({
    required StocksRepository stocksRepository,
  })  : _stocksRepository = stocksRepository,
        super(StocksState()) {
    on<LoadStocks>(_loadStocks);
    on<AddStock>(_addStock);
  }

  final StocksRepository _stocksRepository;

  Future<void> _loadStocks(
    LoadStocks event,
    Emitter<StocksState> emit,
  ) async {
    emit(
      state.copyWith(
        status: StocksStatus.loading,
      ),
    );

    List<DetailedStockModel> stocks = await _stocksRepository.getStocks();

    return emit(
      state.copyWith(
        status: StocksStatus.success,
        stocks: List.from(stocks),
      ),
    );
  }

  Future<void> _addStock(
    AddStock event,
    Emitter<StocksState> emit,
  ) async {
    List<DetailedStockModel> stocks = List.from(state.stocks);
    DetailedStockModel stock = await _stocksRepository.getDetailedStockModel(
      event.stock.symbol,
    );
    stocks.add(stock);

    return emit(
      state.copyWith(
        stocks: stocks,
      ),
    );
  }
}
