part of asset_domain_module;

@HiveType(typeId: kHiveTypePrices)
class Prices extends HiveObject {
  Prices() {
    coinPrices = {};
    fiatPrices = {};
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
    coinUpdatedAt = DateTime.now();
    fiatUpdatedAt = DateTime.now();
  }

  /// USD price of a coin
  /// Example: BTC => 10000.00
  @HiveField(0)
  late Map<String, double> coinPrices;

  /// Exchange rate between USD and other fiat currencies
  /// Example: USDCNY => 7.00
  @HiveField(1)
  late Map<String, double> fiatPrices;

  @HiveField(2)
  late DateTime createdAt;
  @HiveField(3)
  late DateTime updatedAt;
  @HiveField(4)
  late DateTime coinUpdatedAt;
  @HiveField(5)
  late DateTime fiatUpdatedAt;
}
