part of trade_domain_module;

abstract class TradeHomeVM implements Built<TradeHomeVM, TradeHomeVMBuilder> {
  factory TradeHomeVM([void Function(TradeHomeVMBuilder) b]) = _$TradeHomeVM;
  TradeHomeVM._();

// Fields

  bool get hasWallet;
  String get ethAddress;

  TradePair get tradePair;
  TradeSide get tradeSide;
  String get fiatCurrency;
  //@nullable
  String? get activeWalletId;

  //@nullable
  AssetCoin? get priceCoinInfo;
  //@nullable
  AssetCoin? get tradeCoinInfo;
  //@nullable
  AssetCoin? get sideCoinInfo;
  //@nullable
  TradeConfigCoin? get sideCoinConfig;

  BuiltList<TradePair> get allTradePairs;
// Methods

  @BuiltValueField(compare: false)
  Future<void> Function(TradePair tradePair) get doUpdateCoinBalance;

  @BuiltValueField(compare: false)
  Future<double> Function(TradePair) get getApproveBalance;

  //@nullable
  @BuiltValueField(compare: false)
  Future<void> Function(TradeSide tradeSide)? get doChangeTradeSide;

  @BuiltValueField(compare: false)
  Future<void> Function(TradePair tradePair) get doChangeTradePair;

  @BuiltValueField(compare: false)
  Future<void> Function(TradePair tradePair) get doSubscribeMqtt;

  @BuiltValueField(compare: false)
  AssetCoin Function({
    required String chain,
    required String symbol,
  }) get getCoinInfo;

  @BuiltValueField(compare: false)
  Future<WalletPrivateData> Function(String password) get doUnlockWallet;

  @BuiltValueField(compare: false)
  Future<void> Function({
    required TradeSide tradeSide,
    required TradePair tradePair,
    required Future<bool> Function({
      required WalletTemplateData approveData,
      required double currentBalance,
      required double approveAmount,
      required bool needReset,
    })
        onConfirmSubmit,
    required Future<WalletPrivateData> Function() onUnlockWallet,
    required void Function(String) onSuccessTransaction,
  }) get doApproveOrder;

  @BuiltValueField(compare: false)
  Future<void> Function({
    required TradeSide tradeSide,
    required TradePair tradePair,
    required String price,
    required String amount,
    required String total,
    required Future<bool> Function(DexCreateOrderParams) onConfirmSubmit,
    required Future<WalletPrivateData> Function() onUnlockWallet,
    required void Function(String) onSuccessTransaction,
  }) get doCreateOrder;

  @BuiltValueField(compare: false)
  Future<void> Function({
    required TradeOrder order,
    required Future<bool> Function(double) onConfirmCancel,
    required Future<WalletPrivateData> Function() onUnlockWallet,
    required void Function(String) onSuccessTransaction,
  }) get doCancelOrder;

  @BuiltValueField(compare: false)
  Future<Transaction> Function({
    required String chain,
    required String symbol,
    required String fromAddress,
    required int chainPrecision,
    required String txId,
  }) get getTransactionInfo;

  @BuiltValueField(compare: false)
  Future<void> Function({
    required WithdrawSubmitParams param,
    required String txId,
  }) get transferResult;

  @BuiltValueField(compare: false)
  bool Function(TradePair) get needShowSlowTradePair;

  @BuiltValueField(compare: false)
  void Function(TradePair) get doHideSlowTradePair;

  @BuiltValueField(compare: false)
  Future<double> Function(TradeOrder order) get getOrderBalance;

  static TradeHomeVM fromStore(Store<AppState> store) {
    final tradeState = store.state.tradeState;
    final activeWalletId = store.state.walletState.activeWalletId;
    final fiatCurrency = store.state.commonState.fiatCurrency ?? '';
    //final tradePair = tradeState.tradePair;
    /*
    final tradeCoinInfo = VMWithWalletGetCoinInfoImplement.getCoinInfo(
      store,
      chain: tradePair?.tradeChain ?? '',
      symbol: tradePair?.tradeSymbol ?? '',
    );
    final priceCoinInfo = VMWithWalletGetCoinInfoImplement.getCoinInfo(
      store,
      chain: tradePair?.priceChain ?? '',
      symbol: tradePair?.priceSymbol ?? '',
    );
    final sideCoinInfo =
        tradeState.tradeSide == TradeSide.buy ? priceCoinInfo : tradeCoinInfo;
    final sideCoinConfig = tradeState.getCoinConfig(
      chain: sideCoinInfo.chain ?? '',
      symbol: sideCoinInfo.symbol ?? '',
    );
    */
    return TradeHomeVM(
      (viewModel) => viewModel
        ..hasWallet = store.state.walletState.hasWallet
        ..ethAddress = store.state.walletState.activeWallet!.ethAddress
        //..tradePair = tradePair!.toBuilder()
        ..tradeSide = tradeState.tradeSide
        ..fiatCurrency = fiatCurrency
        ..activeWalletId = activeWalletId
        //..tradeCoinInfo = tradeCoinInfo.toBuilder()
        //..priceCoinInfo = priceCoinInfo.toBuilder()
        //..sideCoinInfo = sideCoinInfo.toBuilder()
        //..sideCoinConfig = sideCoinConfig.toBuilder()
        ..allTradePairs = ListBuilder(tradeState.config?.allTradePairs ?? [])
        ..getCoinInfo = ({required chain, required symbol}) {
          return VMWithWalletGetCoinInfoImplement.getCoinInfo(
            store,
            chain: chain,
            symbol: symbol,
          );
        }
        ..getTransactionInfo = ({
          required chain,
          required symbol,
          required fromAddress,
          required chainPrecision,
          required txId,
        }) {
          final completer = Completer<Transaction>();
          store.dispatch(
            AssetActionGetSingleTransaction(
              txId: txId,
              chain: chain,
              symbol: symbol,
              fromAddress: fromAddress,
              chainPrecision: chainPrecision,
              completer: completer,
            ),
          );
          return completer.future;
        }
        ..doUpdateCoinBalance = (tradePair) {
          final tradeSide = tradeState.tradeSide;
          final coinInfo = VMWithWalletGetCoinInfoImplement.getCoinInfo(
            store,
            chain: tradePair.sideChain(tradeSide),
            symbol: tradePair.sideSymbol(tradeSide),
          );
          return store.dispatchAsync(
            AssetActionGetCoinBalance(
              wallet: store.state.walletState.activeWallet!,
              chain: coinInfo.chain ?? '',
              symbol: coinInfo.symbol ?? '',
              address: coinInfo.address ?? '',
              ignoreBalanceLock:
                  !kChainsNeedLockBalance.contains(coinInfo.chain),
            ),
          );
        }
        ..getApproveBalance = (tradePair) {
          final tradeSide = tradeState.tradeSide;
          final coinInfo = VMWithWalletGetCoinInfoImplement.getCoinInfo(
            store,
            chain: tradePair.sideChain(tradeSide),
            symbol: tradePair.sideSymbol(tradeSide),
          );

          final completer = Completer<double>();
          store.dispatch(
            TradeActionGetApproveBalance(
              chain: coinInfo.chain ?? '',
              symbol: coinInfo.symbol ?? '',
              completer: completer,
            ),
          );
          return completer.future;
        }
        ..doUnlockWallet = (password) {
          final completer = Completer<WalletPrivateData>();
          store.dispatch(WalletActionWalletUnlock(password, completer));
          return completer.future;
        }
        ..doApproveOrder = ({
          required tradeSide,
          required tradePair,
          required onUnlockWallet,
          required onConfirmSubmit,
          required onSuccessTransaction,
        }) {
          return store.dispatchAsync(TradeActionOrderApprove(
            tradePair: tradePair,
            tradeSide: tradeSide,
            onUnlockWallet: onUnlockWallet,
            onConfirmSubmit: onConfirmSubmit,
            onSuccessTransaction: onSuccessTransaction,
          ));
        }
        ..doCreateOrder = ({
          required tradeSide,
          required tradePair,
          required price,
          required amount,
          required total,
          required onUnlockWallet,
          required onConfirmSubmit,
          required onSuccessTransaction,
        }) {
          return store.dispatchAsync(TradeActionOrderCreate(
            tradeSide: tradeSide,
            tradePair: tradePair,
            price: NumberUtil.getDouble(price),
            amount: NumberUtil.getDouble(amount),
            total: NumberUtil.getDouble(total),
            onUnlockWallet: onUnlockWallet,
            onConfirmSubmit: onConfirmSubmit,
            onSuccessTransaction: onSuccessTransaction,
          ));
        }
        ..doCancelOrder = ({
          required order,
          required onUnlockWallet,
          required onConfirmCancel,
          required onSuccessTransaction,
        }) {
          return store.dispatchAsync(TradeActionOrderCancel(
            order: order,
            onUnlockWallet: onUnlockWallet,
            onConfirmCancel: onConfirmCancel,
            onSuccessTransaction: onSuccessTransaction,
          ));
        }
        ..doChangeTradePair = (tradePair) {
          return store.dispatchAsync(
            TradeActionOrderChangePair(tradePair),
          );
        }
        ..doChangeTradeSide = (tradeSide) {
          return store.dispatchAsync(
            TradeActionOrderChangeSide(tradeSide),
          );
        }
        ..doSubscribeMqtt = (tradePair) {
          return store.dispatchAsync(
            TradeActionSubscribeMqttOrder(tradePair),
          );
        }
        ..needShowSlowTradePair = (tradePair) {
          return !store.state.tradeState.hideSlowTradePairTip
                  .contains(tradePair.id) &&
              tradePair.isSlow;
        }
        ..getOrderBalance = (order) {
          final completer = Completer<double>();
          store.dispatch(TradeActionGetOrderBalance(
            order: order,
            completer: completer,
          ));
          return completer.future;
        }
        ..doHideSlowTradePair = (tradePair) {
          store.dispatch(TradeActionTipHideSlowTradePair(tradePair));
        }
        ..transferResult = ({required param, required txId}) {
          return store.dispatchAsync(
            AssetActionAddTransaction(
              Transaction.fromSubmit(
                params: param,
                txId: txId,
              ),
            ),
          );
        },
    );
  }
}
