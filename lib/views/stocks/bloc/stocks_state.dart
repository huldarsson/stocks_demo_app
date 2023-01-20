part of 'stocks_bloc.dart';

enum StocksStatus { initial, loading, success, failure }

extension StocksStatusExtension on StocksStatus {
  bool get isInitial => this == StocksStatus.initial;
  bool get isLoading => this == StocksStatus.loading;
  bool get isSuccess => this == StocksStatus.success;
  bool get isFailure => this == StocksStatus.failure;
}

class StocksState extends Equatable {
  StocksState({
    this.status = StocksStatus.initial,
    List<DetailedStockModel>? stocks,
  }) : stocks = stocks ?? [];

  final StocksStatus status;
  final List<DetailedStockModel> stocks;

  @override
  List<Object> get props => [
        status,
        stocks,
      ];

  StocksState copyWith({
    StocksStatus? status,
    List<DetailedStockModel>? stocks,
  }) {
    return StocksState(
      status: status ?? this.status,
      stocks: stocks ?? this.stocks,
    );
  }
}
