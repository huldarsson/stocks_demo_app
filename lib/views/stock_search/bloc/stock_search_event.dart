part of 'stock_search_bloc.dart';

abstract class StockSearchEvent extends Equatable {
  const StockSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadStocks extends StockSearchEvent {
  const LoadStocks({
    required this.searchString,
  });
  final String searchString;

  @override
  List<Object> get props => [searchString];
}
