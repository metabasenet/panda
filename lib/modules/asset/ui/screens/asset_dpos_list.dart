part of asset_ui_module;

class AssetDposList extends StatefulWidget {
  const AssetDposList(
    this.coinInfo, {
    Key? key,
  }) : super(key: key);

  final AssetCoin coinInfo;

  static const routeName = '/asset/dpos/list';

  static void open(AssetCoin item) {
    AppNavigator.push(routeName, params: item);
  }

  static Route<dynamic> route(RouteSettings settings, [AssetCoin? item]) {
    return DefaultTransition(
      settings,
      AssetDposList(item ?? settings.arguments! as AssetCoin),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _AssetDposList();
  }
}

class _AssetDposList extends State<AssetDposList> {
  var voteNodeList = []; // nodelist
  void checkIfWalletHasBackup(BuildContext context, AssetDetailVM viewModel) {
    if (!(viewModel.activeWallet?.hasBackup ?? false) && !kDebugMode) {
      showConfirmDialog(
        context,
        content: tr('asset:detail_msg_backup'),
        title: tr('global:dialog_alert_title'),
        cancelBtnText: tr('global:btn_next_time'),
        confirmBtnText: tr('asset:detail_btn_backup'),
        onConfirm: () {
          // showPasswordDialog(
          //   context,
          //       (password) => viewModel.doUnlockWallet(password),
          //       (data, _) {
          //     WalletBackupPage.open(data.mnemonic);
          //   },
          // );
        },
      );
    }
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
              tr('asset:detail_lbl_total', namedArgs: {
                'name': widget.coinInfo.name ?? '',
                'fullName': widget.coinInfo.fullName ?? '',
              }),
              style: context.textSecondary(
                bold: true,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            AssetBalanceListener(
              item: widget.coinInfo,
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
                  item: widget.coinInfo,
                  builder: (
                    context, {
                    balance,
                    unconfirmed,
                    data,
                  }) =>
                      AssetPriceListener(
                    symbol: widget.coinInfo.symbol,
                    amount: double.tryParse(balance ?? '0') ?? 0,
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
                                widget.coinInfo.symbol ?? '',
                                double.tryParse(balance!) ?? 0),
                            //price,
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

  Widget buildTransactionTitle(BuildContext context) {
    return
        // Padding(
        // padding: context.edgeBottom5.copyWith(left: 4),

        // child:
        Text(
      tr('asset:dpos_node_infor'),
      style: context.textMedium(
        bold: true,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget buildTransactionTitle1(BuildContext context) {
    return
        //  Padding(
        //   padding: context.edgeBottom5.copyWith(left: 4),
        //   child:
        Text(
      tr('asset:non_dpos_node_infor'),
      style: context.textMedium(
        bold: true,
        fontWeight: FontWeight.normal,
      ),
    );
    // );
  }

  @override
  void initState() {
    AssetRepository()
        .getVoteNode(address: AppConstants.dposAddress)
        .then((res) => {
              setState(() {
                voteNodeList = res as List<dynamic>;
              }),
            });
  }

  void onChanged() {
    initState();
  }

  @override
  Widget build(BuildContext context) {
    return CSScaffold(
      addBottomInset: false,
      title: tr('asset:node_vote_infor'),
      child: StoreConnector<AppState, AssetDetailVM>(
        distinct: true,
        converter: AssetDetailVM.fromStore,
        onInitialBuild: (_, __, viewModel) {
          checkIfWalletHasBackup(context, viewModel);
//          request.add(CSListViewParams.withParams(_GetAssetListParams()));
        },
        builder: (context, viewModel) => Column(
          children: [
            Expanded(
              child: CSListViewStream<_GetAssetListParams>(
                enablePullDown: false,
                enablePullUp: false,
                margin: context.edgeHorizontal,
                padding: context.edgeAll,
                decoration: context.boxDecorationOnlyTop(),
                slivers: [
                  SliverToBoxAdapter(child: buildHeader(context, viewModel)),
                ],
                itemHeader: buildTransactionTitle(context),
                itemCount: voteNodeList.length,
                itemBuilder: (context, index) => TransDropItem(
                  item: voteNodeList[index],
                  coinInfo: widget.coinInfo,
                  onChanged: onChanged,
                  nonce: 0,
                ),
                emptyLabel: tr('asset:detail_msg_empty'),
                emptyImageUrl: 'assets/images/empty_record.png',
                requestStream: null,
                onLoadData: (_) => Future<int>.value(0),
              ),
            ),
            SizedBox(
              height: context.edgeSize,
            ),
            Expanded(
              child: CSListViewStream<_GetAssetListParams>(
                enablePullDown: false,
                enablePullUp: false,
                margin: context.edgeHorizontal,
                padding: context.edgeAll,
                decoration: context.boxDecorationOnlyTop(),
                // slivers: [
                //   SliverToBoxAdapter(child: buildHeader(context, viewModel)),
                // ],
                itemHeader: buildTransactionTitle1(context),
                itemCount: voteNodeList.length,
                itemBuilder: (context, index) => TransDropItem(
                  item: voteNodeList[index],
                  coinInfo: widget.coinInfo,
                  onChanged: onChanged,
                  nonce: 1,
                ),
                emptyLabel: tr('asset:detail_msg_empty'),
                emptyImageUrl: 'assets/images/empty_record.png',
                requestStream: null,
                onLoadData: (_) => Future<int>.value(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
