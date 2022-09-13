part of trade_ui_module;

class TradeHomePage extends HookWidget {
  static late InAppWebViewController webView;
  static Completer<String> completer = Completer<String>();
  static late WithdrawSubmitParams params;

  @override
  Widget build(BuildContext context) {
    final backLastTime = useState(0);

    useEffect(
      () {
        // When change language, force refresh
        backLastTime.value = backLastTime.value - 1;
        return null;
      },
      [context.locale.languageCode],
    );

    //random number
    final ranNumber = formatDate(DateTime.now(), 'yyyyMMddHHmm');

    return Scaffold(
      backgroundColor: context.bgSecondaryColor,
      appBar: AppBar(
        title: Text(
          'MNT/USDT@Uniswap V2',
          style: context.textHuge(
            fontWeight: FontWeight.w700,
            bold: true,
          ),
        ),
      ),
      body: Center(
        child: StoreConnector<AppState, TradeHomeVM>(
          distinct: true,
          converter: TradeHomeVM.fromStore,
          builder: (context, viewModel) {
            if (viewModel.hasWallet && viewModel.ethAddress != '') {
              return InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    'https://totems.metabasenet.site/?ran=$ranNumber',
                  ),
                ),
                onWebViewCreated: (controller) {
                  webView = controller;

                  webView.addJavaScriptHandler(
                    handlerName: 'Refresh',
                    callback: (args) {
                      //Update balances list
                      TradeHomeVM.activeStore?.dispatch(
                        AssetActionUpdateWalletBalances(
                          wallet: viewModel.activeWallet!,
                          skipFrequentUpdate: true,
                        ),
                      );

                      return 'refresh';
                    },
                  );

                  controller.addJavaScriptHandler(
                    handlerName: 'init',
                    callback: (args) {
                      return {
                        'PrivateKey': '',
                        'Address': viewModel.ethAddress
                      };
                    },
                  );
                  controller.addJavaScriptHandler(
                    handlerName: 'verify',
                    callback: (args) async {
                      final ret = Completer<String>();
                      showPasswordDialog(
                        context,
                        (password) => viewModel.doUnlockWallet(password),
                        (walletData, _) async {
                          final pri = await WalletRepository().exportPrivateKey(
                            mnemonic: walletData.mnemonic!,
                            chain: 'ETH',
                            forkId: '',
                          );
                          ret.complete(pri);
                        },
                      );
                      return ret.future;
                    },
                  );
                  controller.addJavaScriptHandler(
                    handlerName: 'TransferResult',
                    callback: (args) async {
                      final ret = args[0] as Map<String, dynamic>;
                      if (completer.isCompleted == false) {
                        final txid = ret['txid'] as String;
                        viewModel.transferResult(
                          param: TradeHomePage.params,
                          txId: txid,
                        );
                        completer.complete(txid);
                      }
                      return ret;
                    },
                  );
                },
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CSContainer(
                      child: Center(
                        child: CSEmpty(
                          width: 250,
                          height: 127,
                          imageUrl: 'assets/images/empty_wallet.png',
                          showButton: true,
                          btnText: tr('wallet:msg_create_wallet_tips'),
                          onPressed: () {
                            AppNavigator.gotoTabBarPage(AppTabBarPages.wallet);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
