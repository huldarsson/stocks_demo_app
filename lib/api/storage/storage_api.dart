abstract class StorageApi {
  Future<void> addSymbol(String symbol);
  Future<List<String>> getSymbols();
}
