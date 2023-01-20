import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks_demo_app/api/storage/storage_api.dart';

class LocalStorageApi extends StorageApi {
  final String _stocksKey = 'stocks';

  @override
  Future<void> addSymbol(String symbol) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stocks = prefs.getStringList(_stocksKey) ?? [];
    stocks.add(symbol);
    await prefs.setStringList(_stocksKey, stocks);
  }

  @override
  Future<List<String>> getSymbols() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_stocksKey) ?? [];
  }
}
