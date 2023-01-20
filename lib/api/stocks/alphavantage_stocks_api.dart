import 'dart:async';
import 'dart:convert';

import 'package:stocks_demo_app/api/stocks/stocks_api.dart';
import 'package:stocks_demo_app/models/data_point_model.dart';
import 'package:stocks_demo_app/models/graph_model.dart';
import 'package:stocks_demo_app/models/price_model.dart';
import 'package:stocks_demo_app/models/stock_model.dart';
import 'package:stocks_demo_app/models/detailed_stock_model.dart';
import 'package:http/http.dart' as http;

const String _key = 'OKT99N2SW8LLWJ48';
const String _baseUrl = 'alphavantage.co';
const String _path = '/query';

String _uppercaseFirstLetter(String from) {
  return from.toLowerCase().replaceRange(0, 1, from[0].toUpperCase());
}

class AlphavantageStocksApi extends StocksApi {
  @override
  Future<DetailedStockModel> getDetailedStock(String symbol) async {
    var client = http.Client();
    var uri = Uri.https(_baseUrl, _path, {
      'function': 'OVERVIEW',
      'symbol': symbol,
      'apikey': _key,
    });
    var response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    print(response.body);
    print(response.statusCode);
    return DetailedStockModel(
      symbol: json['Symbol'],
      name: json['Name'],
      description: json['Description'],
      currency: json['Currency'],
      sector: _uppercaseFirstLetter(json['Sector']),
      industry: _uppercaseFirstLetter(json['Industry']),
      marketCap: int.tryParse(json['MarketCapitalization']) ?? 0,
    );
  }

  @override
  Future<List<StockModel>> searchForStock(String searchString) async {
    var client = http.Client();
    var uri = Uri.https(_baseUrl, _path, {
      'function': 'SYMBOL_SEARCH',
      'keywords': searchString,
      'apikey': _key,
    });
    var response = await client.get(uri);
    Map<String, dynamic> body = jsonDecode(response.body);
    if (!body.containsKey('bestMatches')) {
      return [];
    }
    List matches = body['bestMatches'];

    return matches
        .map(
          (e) => StockModel(
            symbol: e['1. symbol'],
            name: e['2. name'],
            region: e['4. region'],
            marketOpen: e['5. marketOpen'],
            marketClose: e['6. marketClose'],
          ),
        )
        .toList();
  }

  @override
  Future<PriceModel> getCurrentPrice(String symbol) async {
    var client = http.Client();
    var uri = Uri.https(_baseUrl, _path, {
      'function': 'GLOBAL_QUOTE',
      'symbol': symbol,
      'apikey': _key,
    });
    var response = await client.get(uri);
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String, dynamic> quote = body['Global Quote'];

    double price = double.parse(quote['05. price']);
    double previousClose = double.parse(quote['08. previous close']);
    double changePercentage = (price - previousClose) / previousClose * 100;
    return PriceModel(
      open: double.parse(quote['02. open']),
      high: double.parse(quote['03. high']),
      low: double.parse(quote['04. low']),
      price: price,
      previousClose: previousClose,
      change: double.parse(quote['09. change']),
      changePercentage: '${changePercentage.toStringAsFixed(2)}${'%'}',
    );
  }

  @override
  Future<GraphModel> getGraphData({
    required String symbol,
    required GraphInterval interval,
  }) async {
    var client = http.Client();
    var uri = Uri.https(_baseUrl, _path, {
      'function': 'TIME_SERIES_INTRADAY',
      'symbol': symbol,
      'interval': interval.key,
      'apikey': _key,
    });
    var response = await client.get(uri);
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String, dynamic> timeSeriesMap = body['Time Series (${interval.key})'];
    List<dynamic> timeSeries = timeSeriesMap.keys
        .map(
          (key) => {
            'date': DateTime.parse(key),
            ...timeSeriesMap[key],
          },
        )
        .toList();

    return GraphModel(
      dataPoints: timeSeries
          .map((e) => DataPointModel(
                open: double.tryParse(e['1. open']) ?? 0,
                high: double.tryParse(e['2. high']) ?? 0,
                low: double.tryParse(e['3. low']) ?? 0,
                close: double.tryParse(e['4. close']) ?? 0,
                volume: int.tryParse(e['5. volume']) ?? 0,
                date: e['date'],
              ))
          .toList(),
    );
  }
}
