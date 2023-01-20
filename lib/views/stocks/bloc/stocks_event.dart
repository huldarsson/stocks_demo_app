part of 'stocks_bloc.dart';

abstract class StocksEvent extends Equatable {
  const StocksEvent();

  @override
  List<Object> get props => [];
}

class LoadStocks extends StocksEvent {}

class AddStock extends StocksEvent {
  const AddStock({
    required this.stock,
  });

  final StockModel stock;

  @override
  List<Object> get props => [stock];
}
