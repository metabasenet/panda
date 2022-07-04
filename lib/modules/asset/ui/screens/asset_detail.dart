part of asset_ui_module;

const _chainTake = {AppConstants.mnt_chain: 20, 'TRX': 20};

class AssetDetailStatus {
  static const all = 'all';
  static const withdraw = 'withdraw';
  static const deposit = 'deposit';
}

class _GetAssetListParams {
  _GetAssetListParams({
    this.selectedTab = AssetDetailStatus.all,
  });

  final String selectedTab;

  @override
  String toString() {
    return 'GetAssetListParams(selectedTab: $selectedTab)';
  }
}

class AssetDetailPage extends HookWidget {
  const AssetDetailPage(
    this.coinInfo, {
    Key? key,
  }) : super(key: key);

  final AssetCoin coinInfo;

  static const routeName = '/asset/detail';

  static void open(AssetCoin item) {
    AppNavigator.push(routeName, params: item);
  }

  static Route<dynamic> route(RouteSettings settings, [AssetCoin? item]) {
    return DefaultTransition(
      settings,
      AssetDetailPage(item ?? settings.arguments as AssetCoin),
    );
  }

  void checkIfWalletHasBackup(BuildContext context, AssetDetailVM viewModel) {
    if (!(viewModel.activeWallet?.hasBackup ?? false) && !kDebugMode) {
      showConfirmDialog(
        context,
        content: tr('asset:detail_msg_backup'),
        title: tr('global:dialog_alert_title'),
        cancelBtnText: tr('global:btn_next_time'),
        confirmBtnText: tr('asset:detail_btn_backup'),
        onConfirm: () {
          showPasswordDialog(
            context,
            (password) => viewModel.doUnlockWallet(password),
            (data, _) {
              WalletBackupPage.open(data.mnemonic!);
            },
          );
        },
      );
    }
  }

  Future<int> loadData(
    AssetDetailVM viewModel,
    AssetDetailCubit cubit, {
    CSListViewParams<_GetAssetListParams>? params,
    bool onlyCache = false,
  }) async {
    if (onlyCache == false && (params?.skip == 0 || params!.isRefresh)) {
      await viewModel
          .doLoadDetail(coinInfo, params!.isRefresh)
          .catchError((error) {
        Toast.showError(error);
        //throw error as Object;
      });
    }

    return cubit
        .loadAll(
      coin: coinInfo,
      isRefresh: params!.isRefresh,
      page: params.page,
      skip: _chainTake[coinInfo.chain] ?? 10,
      onlyCache: onlyCache,
    )
        .catchError((error) {
      Toast.showError(error);
      //throw error as Object;
    });
  }

  Widget buildHeader(BuildContext context, AssetDetailVM viewModel) {
    return CSContainer(
      child: CSContainer(
        secondary: true,
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              tr(
                'asset:detail_lbl_total',
                namedArgs: {
                  'name': coinInfo.name ?? '',
                  'fullName': coinInfo.fullName ?? '',
                },
              ),
              style: context.textSecondary(
                bold: true,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            AssetBalanceListener(
              item: coinInfo,
              builder: (context, {balance, unconfirmed, data}) => PriceText(
                NumberUtil.getFixedBYSix(balance ?? ''),
                '',
                TextSize.big,
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                AssetBalanceListener(
                  item: coinInfo,
                  builder: (
                    context, {
                    balance,
                    unconfirmed,
                    data,
                  }) =>
                      AssetPriceListener(
                    symbol: coinInfo.symbol,
                    amount: double.tryParse(balance ?? '') ?? 0,
                    builder: (context, price, fiatCurrency, _) => Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr(
                              'asset:detail_lbl_valuation',
                              namedArgs: {
                                'symbol': AppConstants.currencySymbol
                              },
                            ),
                            style: context.textSecondary(
                              bold: true,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 10),
                          PriceText(
                            viewModel.activeWallet!.getTotalPrice(
                                coinInfo.symbol ?? '',
                                double.tryParse(balance!) ?? 0),
                            '',
                            TextSize.medium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      color: context.bgPrimaryColor,
      padding: context.edgeAll.copyWith(
        bottom: context.edgeSize + context.safeAreaBottom,
      ),
      child: Padding(
        padding: context.edgeHorizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (coinInfo.name == 'MNT')
              Flexible(
                child: CSButton(
                  label: tr('asset:lbl_vote_button'),
                  onPressed: () {
                    AssetDposList.open(coinInfo);
                  },
                  bordered: true,
                  backgroundColor: context.bgPrimaryColor,
                ),
              ),
            SizedBox(width: context.edgeSize),
            Flexible(
              child: CSButton(
                label: tr('asset:lbl_withdraw'),
                onPressed: () {
                  AssetWithdrawPage.open(coinInfo);
                },
                bordered: true,
                backgroundColor: context.bgPrimaryColor,
              ),
            ),
            SizedBox(width: context.edgeSize),
            Flexible(
              child: CSButton(
                label: tr('asset:lbl_deposit'),
                onPressed: () {
                  AssetDepositPage.open(coinInfo);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionTitle(BuildContext context) {
    return Padding(
      padding: context.edgeBottom5.copyWith(left: 4),
      child: Text(
        tr('asset:detail_lbl_transaction'),
        style: context.textMedium(
          bold: true,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCubit = useState<AssetDetailCubit>(
      GetIt.I<AssetTransactionCubit>(),
    );

    final request =
        useBehaviorStreamController<CSListViewParams<_GetAssetListParams>>();

    return CSScaffold(
      addBottomInset: false,
      title: tr('asset:detail_title'),
      child: StoreConnector<AppState, AssetDetailVM>(
        distinct: true,
        converter: AssetDetailVM.fromStore,
        onInitialBuild: (_, __, viewModel) {
          checkIfWalletHasBackup(context, viewModel);
          request.add(CSListViewParams.withParams(_GetAssetListParams()));
        },
        builder: (context, viewModel) => Column(
          children: [
            Expanded(
              child: BlocBuilder<AssetDetailCubit, List<Transaction>>(
                bloc: selectedCubit.value,
                builder: (context, data) =>
                    CSListViewStream<_GetAssetListParams>(
                  requestStream: request,
                  margin: context.edgeHorizontal,
                  padding: context.edgeAll,
                  decoration: context.boxDecorationOnlyTop(),
                  slivers: [
                    // SliverAppBar(
                    //   leading: SizedBox(),
                    //   title: SizedBox(),
                    //   elevation: 0,
                    //   backgroundColor: context.bgSecondaryColor,
                    //   expandedHeight: 200,
                    //   collapsedHeight: 1,
                    //   toolbarHeight: 0,
                    //   flexibleSpace: FlexibleSpaceBar(
                    //     background: buildHeader(context),
                    //   ),
                    // ),
                    SliverToBoxAdapter(child: buildHeader(context, viewModel)),
                  ],
                  onLoadCachedData: (params) {
                    return loadData(
                      viewModel,
                      selectedCubit.value,
                      params: params,
                      onlyCache: true,
                    );
                  },
                  onLoadData: (params) {
                    return loadData(
                      viewModel,
                      selectedCubit.value,
                      params: params,
                    );
                  },
                  itemCount: data.length,
                  itemHeader: buildTransactionTitle(context),
                  itemBuilder: (context, index) =>
                      TransactionListItem(item: data[index]),
                  emptyLabel: tr('asset:detail_msg_empty'),
                  emptyImageUrl: 'assets/images/empty_record.png',
                ),
              ),
            ),
            DividerShadow(),
            buildFooter(context),
          ],
        ),
      ),
    );
  }
}
