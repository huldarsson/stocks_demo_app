part of 'stock_bloc.dart';

enum StockStatus { initial, loading, success, failure }

extension StockStatusExtension on StockStatus {
  bool get isInitial => this == StockStatus.initial;
  bool get isLoading => this == StockStatus.loading;
  bool get isSuccess => this == StockStatus.success;
  bool get isFailure => this == StockStatus.failure;
}

class StockState extends Equatable {
  const StockState({
    this.status = StockStatus.initial,
    this.stock,
    this.graph,
  });

  final StockStatus status;
  final DetailedStockModel? stock;
  final GraphModel? graph;

  StockState copyWith({
    StockStatus? status,
    DetailedStockModel? stock,
    GraphDuration? duration,
    GraphModel? graph,
  }) {
    return StockState(
      status: status ?? this.status,
      stock: stock ?? this.stock,
      graph: graph ?? this.graph,
    );
  }

  @override
  List<Object?> get props => [status, stock, graph];
}
