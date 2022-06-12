part of asset_domain_module;

class AssetRepository {
  factory AssetRepository([AssetApi? _api]) {
    _instance._api = _api ?? AssetApi();
    return _instance;
  }
  AssetRepository._internal();

  late AssetApi _api;
  static final _instance = AssetRepository._internal();

  late String fingerprint;

  static late Box<Prices> _prices;
  static late LazyBox<List<dynamic>> _transactions;

  static const _pricesKey = 'prices_v1';
  static const _transactionsKey = 'transactions_v1';

  Future<void> initializeCache() async {
    _prices = await AppHiveCache.openBox<Prices>(_pricesKey);
    _transactions =
        await AppHiveCache.openLazyBox<List<dynamic>>(_transactionsKey);

    if (_prices.get(_pricesKey) == null) {
      await _prices.put(
        _pricesKey,
        Prices(),
      );
    }
  }

  /// ***  Prices *** ///

  Future<Map<String, dynamic>> getCoinPrice(String tradePairId) async {
    //final json = await _api.getCoinPrice(tradePairId);
    //return json;
    return {};
  }

  Future<Map<String, dynamic>?> getDexPrices() async {
    //final prices = await _api.getDexPrices();
    //return prices;
    return null;
  }

  Future<void> savePricesToCache({
    Map<String, double>? coinPrices,
    Map<String, double>? fiatPrices,
  }) async {
    /*
    final prices = _prices?.get(_pricesKey);
    prices.coinPrices = coinPrices ?? prices.coinPrices;
    prices.fiatPrices = fiatPrices ?? prices.fiatPrices;
    if (coinPrices != null && coinPrices.isNotEmpty) {
      prices.coinUpdatedAt = DateTime.now();
    }
    if (fiatPrices != null && fiatPrices.isNotEmpty) {
      prices.fiatUpdatedAt = DateTime.now();
    }
    prices.updatedAt = DateTime.now();
    await prices.save();
    */
  }

  /// Price of coins in USD
  /// - This api will return a map of Coin symbol with USD price
  /// - Es: BTC => 12000 (USD)
  Future<Map<String, double>> getCoinPrices() async {
    final json = await _api.getPrices();
    final data = <String, double>{};
    json.forEach((key, value) {
      data[key] = NumberUtil.getDouble(value['USD']);
    });
    await savePricesToCache(coinPrices: data);
    return data;
    //return {'BTC': 12000, 'ETH': 1200, 'MNT': 120, 'SUG': 12, 'TRX': 1.2};

    /*
    final prices = _prices?.get(_pricesKey);
    if (prices.coinPrices.isNotEmpty &&
        prices.coinUpdatedAt != null &&
        DateTime.now().difference(prices.coinUpdatedAt).inMinutes < 2) {
      return prices.coinPrices;
    }
    final json = await _api.getPrices();
    final data = <String, double>{};
    json.forEach((key, value) {
      data[key] = NumberUtil.getDouble(value['USD']);
    });
    await savePricesToCache(coinPrices: data);
    return data;
    */
  }

  /// Exchange rates from USD to other Fiat currency
  /// - This api will return the exchange rate between USD
  /// and other fiat currency such CNY
  /// - Es: USD_CNY => 6.98
  /// - Es: USD_USD => 1
  Future<Map<String, double>> getFiatPrices() async {
    return {'USD_CNY': 6.98, 'USD_USD': 1};
    /*
    final prices = _prices?.get(_pricesKey);
    if (prices.fiatPrices.isNotEmpty &&
        prices.fiatUpdatedAt != null &&
        DateTime.now().difference(prices.fiatUpdatedAt).inMinutes < 60) {
      return prices.fiatPrices;
    }

    final json = await _api.getExchangeRates();
    final data = <String, double>{};
    json.forEach((key, value) {
      data[key] = NumberUtil.getDouble(value);
    });
    await savePricesToCache(fiatPrices: data);
    return data;
    */
  }

  /// ***  Balances *** ///

  Future<Map<String, dynamic>?> getTransactionFee({
    required String symbol,
    required String address,
  }) async {
    final res = await _api.getTransactionFeeInformation(
      symbol: symbol,
      address: address,
    );
    return res;
  }

  Future<List<dynamic>?> getVoteNode() async {
    final res = await _api.getVoteNodeList();
    return res;
  }

  Future<Map<String, dynamic>> getVoteNodeDetail({
    required String delegate,
    required String owner,
    required int rewardmode,
  }) async {
    final res = await _api.getVoteNodeDetail(
        delegate: delegate, owner: owner, rewardmode: rewardmode);
    //print(res);
    return res;

    //return getVote(delegate, owner, rewardmode);
  }

  //Send voting transaction
  Future<dynamic> submitTransaction({
    required String hex,
  }) async {
    final res = await _api.submitTransaction(hex: hex);
    return res;
  }

  Future<Map<String, String>> getCoinBalance({
    required String chain,
    required String symbol,
    required String address,
    required String contract,
  }) async {
    if (chain == AppConstants.mnt_chain) {
      final res = await _api.getCoinBalanceWithUnconfirmed(
        chain: chain,
        symbol: symbol,
        address: address,
      );
      return {
        'balance': res['balance'].toString(),
        'unconfirmed': res['unconfirmed'].toString()
      };
    } else if (chain == 'ETH' && symbol == 'BNB') {
      final res = await _api.getCoinBalanceBNB(
        chain: chain,
        symbol: symbol,
        address: address,
      );
      return {
        'balance': res['balance'].toString(),
        'unconfirmed': res['unconfirmed'].toString()
      };
    } else if (chain == 'ETH' && (symbol == 'MNT' || symbol == 'USDT')) {
      final res = await _api.getCoinBalanceBMU(
        chain: chain,
        symbol: symbol,
        address: address,
      );
      return {
        'balance': res['balance'].toString(),
        'unconfirmed': res['unconfirmed'].toString()
      };
    } else {
      return {
        'balance': '0',
        'unconfirmed': '0',
      };
    }
  }

  /// ***  Search Coins *** ///

  Future<List<Map<String, dynamic>>> searchCoins(
    String chain,
    String term,
  ) {
    /*
    if (chain == 'ETH') {
      return _api.searchEthTokens(term);
    }*/
    return Future.value([]);
  }

  /// ***  Transactions *** ///

  Future<Map<String, dynamic>> getSingleTransaction({
    required String chain,
    required String symbol,
    required String txId,
    required String walletId,
  }) async {
    /*
    return _api.getSingleTransaction(
      chain: chain,
      symbol: symbol,
      txId: txId,
      walletId: walletId,
    );*/
    return Future.value({});
  }

  Future<MapEntry<int, List<Map<String, dynamic>>>> getTransactionsFromApi({
    required String chain,
    required String symbol,
    required String address,
    required String contract,
    required int page,
    required int skip,
  }) async {
    return MapEntry(0, []);
    /*
    var count = 0;
    var transactions = <Map<String, dynamic>>[];
    switch (symbol) {
      case 'MNT':
        transactions = await _api.getCoinTransactions(
          chain: chain,
          symbol: symbol,
          address: address,
          page: page,
          take: skip,
        );
        count = transactions.length;
        break;
    }
    return MapEntry(count, transactions);
    */
  }

  Future<List<Transaction>> getTransactionsFromCache({
    required String symbol,
    required String address,
  }) async {
    /*
    final list = await _transactions.get(
      '$symbol:$address',
      defaultValue: [],
    );
    return List.from(list);
    */
    return Future.value([]);
  }

  Future<void> saveTransactionsToCache({
    required String symbol,
    required String address,
    required List<Transaction> transactions,
  }) async {
    /*
    await _transactions.put(
      '$symbol:$address',
      transactions,
    );*/
  }

  Future<void> clearTransactionsCache({
    required String symbol,
    required String address,
  }) async {
    //await _transactions.put(
    //  '$symbol:$address',
    //  [],
    //);
  }

  /// ***  Address *** ///

  Future<String> submitAddressAdd({
    required String walletId,
    required String chain,
    required String symbol,
    required String addressId,
    required String address,
    required String comments,
  }) async {
    /*
    final result = await _api.submitAddressAdd(
      walletId: walletId,
      chain: chain,
      symbol: symbol,
      address: address,
      comments: comments,
    );
    return result;
    */
    return '';
  }

  Future<void> submitAddressEdit({
    required String walletId,
    required String chain,
    required String symbol,
    required String addressId,
    required String address,
    required String comments,
  }) async {
    /*
    final result = await _api.submitAddressEdit(
      walletId: walletId,
      chain: chain,
      symbol: symbol,
      addressId: addressId,
      address: address,
      comments: comments,
    );
    return result;
    */
  }

  Future<void> submitAddressDelete({
    required String walletId,
    required String chain,
    required String symbol,
    required String addressId,
  }) async {
    /*
    final result = await _api.submitAddressDelete(
      walletId: walletId,
      chain: chain,
      symbol: symbol,
      addressId: addressId,
    );
    return result;
    */
  }

  Future<List<AssetAddress>> getAddressList({
    required String walletId,
    required String chain,
    required String symbol,
  }) async {
    /*
    final json = await _api.getAddressList(
      walletId: walletId,
      chain: chain,
      symbol: symbol,
    );
    return deserializeListOf<AssetAddress>(json).toList();
    */
    return Future.value([]);
  }
}
