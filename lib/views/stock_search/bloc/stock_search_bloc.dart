import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stocks_demo_app/models/stock_model.dart';
import 'package:stocks_demo_app/repositories/stocks_repository.dart';

part 'stock_search_event.dart';
part 'stock_search_state.dart';

class StockSearchBloc extends Bloc<StockSearchEvent, StockSearchState> {
  StockSearchBloc({
    required this.stocksRepository,
  }) : super(StockSearchState()) {
    on<LoadStocks>(_loadStocks);
  }

  final StocksRepository stocksRepository;

  Future<void> _loadStocks(
    LoadStocks event,
    Emitter<StockSearchState> emit,
  ) async {
    List<StockModel> stocks = await stocksRepository.searchStocks(
      event.searchString,
    );

    emit(
      state.copyWith(
        stocks,
      ),
    );
  }
}
