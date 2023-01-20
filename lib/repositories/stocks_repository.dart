import 'package:stocks_demo_app/api/stocks/stocks_api.dart';
import 'package:stocks_demo_app/api/storage/storage_api.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:stocks_demo_app/models/graph_model.dart';
import 'package:stocks_demo_app/models/price_model.dart';
import 'package:stocks_demo_app/models/stock_model.dart';

class StocksRepository {
  const StocksRepository({
    required StocksApi stocksApi,
    required StorageApi storageApi,
  })  : _stocksApi = stocksApi,
        _storageApi = storageApi;

  final StocksApi _stocksApi;
  final StorageApi _storageApi;

  Future<List<DetailedStockModel>> getStocks() async {
    List<String> symbols = await _storageApi.getSymbols();
    List<DetailedStockModel> stocks = [];

    for (String symbol in symbols) {
      DetailedStockModel stock = await _stocksApi.getDetailedStock(symbol);
      PriceModel price = await _stocksApi.getCurrentPrice(symbol);
      stock = stock.copyWith(price: price);
      stocks.add(stock);
    }

    return stocks;
  }

  Future<DetailedStockModel> getDetailedStockModel(String symbol) async {
    DetailedStockModel stock = await _stocksApi.getDetailedStock(symbol);
    PriceModel price = await _stocksApi.getCurrentPrice(symbol);
    stock = stock.copyWith(price: price);
    return stock;
  }

  Future<void> addStock(String symbol) async {
    return _storageApi.addSymbol(symbol);
  }

  Future<List<StockModel>> searchStocks(String searchString) async {
    return _stocksApi.searchForStock(searchString);
  }

  Future<GraphModel> getGraph(String symbol) async {
    return _stocksApi.getGraphData(
      symbol: symbol,
      interval: GraphInterval.oneHour,
    );
  }
}
