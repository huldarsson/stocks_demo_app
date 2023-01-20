import 'package:stocks_demo_app/models/data_point_model.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:stocks_demo_app/models/graph_model.dart';
import 'package:stocks_demo_app/models/price_model.dart';
import 'package:stocks_demo_app/models/stock_model.dart';

abstract class StocksApi {
  Future<List<StockModel>> searchForStock(String searchString);
  Future<DetailedStockModel> getDetailedStock(String symbol);
  Future<PriceModel> getCurrentPrice(String symbol);
  Future<GraphModel> getGraphData({
    required String symbol,
    required GraphInterval interval,
  });
}
