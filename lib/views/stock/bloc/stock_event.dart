part of 'stock_bloc.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object?> get props => [];
}

class LoadStock extends StockEvent {
  const LoadStock({
    required this.stock,
  });

  final DetailedStockModel stock;

  @override
  List<Object?> get props => [stock];
}
