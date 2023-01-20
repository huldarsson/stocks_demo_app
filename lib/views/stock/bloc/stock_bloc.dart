import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:stocks_demo_app/models/graph_model.dart';
import 'package:stocks_demo_app/repositories/stocks_repository.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc({
    required this.stocksRepository,
  }) : super(const StockState()) {
    on<LoadStock>(_loadStock);
  }

  final StocksRepository stocksRepository;

  Future<void> _loadStock(
    LoadStock event,
    Emitter<StockState> emit,
  ) async {
    emit(
      state.copyWith(
        status: StockStatus.loading,
      ),
    );

    DetailedStockModel stock = await stocksRepository.getDetailedStockModel(
      event.stock.symbol,
    );
    GraphModel graph = await stocksRepository.getGraph(event.stock.symbol);

    emit(
      state.copyWith(
        graph: graph,
        stock: stock,
        status: StockStatus.success,
      ),
    );
  }
}
