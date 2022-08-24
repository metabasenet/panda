part of asset_domain_module;

abstract class AssetListVM implements Built<AssetListVM, AssetListVMBuilder> {
  factory AssetListVM([void Function(AssetListVMBuilder) b]) = _$AssetListVM;
  AssetListVM._();

// Fields
  String get fiatCurrency;

  BuiltList<AssetCoin> get coins;
  bool get isBalanceUpdating;

  List<Wallet> get wallets;
  //@nullable
  bool? get hasWallet;
  //@nullable
  Wallet? get activeWallet;
  String? get activeWalletId;
  WalletStatus? get activeWalletStatus;

// Methods

  @BuiltValueField(compare: false)
  Future<void> Function() get doRefreshList;

  @BuiltValueField(compare: false)
  Future<void> Function(Wallet wallet) get doSwitchWallet;

  @BuiltValueField(compare: false)
  Future<void> Function(Wallet wallet) get doSyncWallet;

  @BuiltValueField(compare: false)
  void Function(bool hide) get doHideSmallAssets;

// Create model

  static AssetListVM fromStore(Store<AppState> store) {
    final assetState = store.state.assetState;

    final coins = sortCoins(
      assetState.coins
          .where((item) => item.isEnabled! || item.isFixed!)
          .toList(),
    );

    //  coins.retainWhere(
    //    (element) => !assetState.hideSmallAssets || element.balance > 0,
    //  )

    return AssetListVM(
      (viewModel) => viewModel
        ..fiatCurrency = store.state.commonState.fiatCurrency
        ..wallets = store.state.walletState.wallets
        ..hasWallet = store.state.walletState.hasWallet
        ..activeWallet = store.state.walletState.activeWallet
        ..activeWalletId = store.state.walletState.activeWalletId
        ..activeWalletStatus = store.state.walletState.activeWalletStatus
        ..coins = ListBuilder(coins) //assetState.coins
        ..isBalanceUpdating = store.state.assetState.isBalanceUpdating
        ..doRefreshList = () {
          //Refresh Synchronous data
          // final InAppWebViewController appWebViewController =
          //     TradeHomePage.webView;
          // var srcRefresh =
          //     'window.dispatchEvent(new CustomEvent("Refresh",{"detail":"refresh"}));';
          // appWebViewController.evaluateJavascript(source: srcRefresh);

          return Future.wait([
            if (store.state.assetState.isBalanceUpdating != true)
              store.dispatchAsync(
                AssetActionUpdateWalletBalances(
                  wallet: store.state.walletState.activeWallet!,
                ),
              ),
            store.dispatchAsync(AssetActionUpdatePrices(
              store.state.commonState.fiatCurrency ?? '',
            )),
          ]);
        }
        ..doSwitchWallet = (wallet) {
          return store.dispatchAsync(AppActionLoadWallet(wallet));
        }
        ..doSyncWallet = (wallet) {
          return store.dispatchAsync(WalletActionWalletRegister(
            wallet,
            withOptions: false,
          ));
        }
        ..doHideSmallAssets = (hide) {
          store.dispatch(AssetActionToggleHideSmallAssets(hide: hide));
        },
    );
  }
}
