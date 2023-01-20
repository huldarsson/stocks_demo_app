part of 'stock_search_bloc.dart';

class StockSearchState extends Equatable {
  StockSearchState({
    List<StockModel>? stocks,
  }) : stocks = stocks ?? [];

  final List<StockModel> stocks;

  StockSearchState copyWith(
    List<StockModel>? stocks,
  ) {
    return StockSearchState(
      stocks: stocks ?? this.stocks,
    );
  }

  @override
  List<Object> get props => [stocks];
}
