part of asset_ui_module;

class AssetDposDetail extends StatefulWidget {
//  const AssetDposDetail({Key key, this.voteNodeItem, this.coinInfo}) : super(key: key);
  const AssetDposDetail(this.voteNodeItem, this.coinInfo);
  static const routeName = '/asset/dpos/detail';

  final voteNodeItem;
  final coinInfo;

  static Route<dynamic> route(RouteSettings settings) {
    final params = settings.arguments as Map<dynamic, dynamic>;
    final node = params['voteNodeItem'];
    final coinInfos = params['coinInfo'];
    return DefaultTransition(settings, AssetDposDetail(node, coinInfos));
  }

  @override
  State<StatefulWidget> createState() {
    return _AssetDposDetail();
  }
}

class _AssetDposDetail extends State<AssetDposDetail> {
  String nodeAddress = '';
  String redeemAddress = '';
  String compoundInterestAddress = '';
  String superNodeAddress = '';
  String superNodeName = '';
  String addressBalance = '';
  String locked = '';
  String investedAmount = '';
  String withdrawalAmount = '';
  String redeemAmount = '';
  double redeemDoubleAmount = 0;
  dynamic nonce;
  dynamic nonceWithdrawal;
  dynamic nonceRedeem;
  //dynamic gas_price;
  //dynamic gas_limit;
  dynamic status = 1;
  dynamic txData;
  final myController = TextEditingController();
  String hex = '';
  String hexRedeem = '';

  Widget buildFooter(BuildContext context, AssetWithdrawVM viewModel) {
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
            Flexible(
              child: CSButton(
                label: tr('asset:lbl_vote_button'),
                onPressed: () {
                  if (double.parse(addressBalance) > 0) {
                    handleCreateTransaction(context, viewModel, 1);
                  } else {
                    Toast.show(tr('global:msg_insufficient_voting_amount'));
                  }
                },
                bordered: true,
                backgroundColor: context.bgPrimaryColor,
              ),
            ),
            SizedBox(width: context.edgeSize),
            Flexible(
              child: CSButton(
                label: tr('asset:lbl_withdrawal_button'),
                onPressed: () {
                  if (double.parse(investedAmount) <= 0) {
                    Toast.show(tr('global:msg_insufficient_withdrawal_amount'));
                  } else if (double.parse(myController.text) >
                      double.parse(investedAmount)) {
                    Toast.show(
                      tr('global:msg_insufficient_withdrawal_greater_amount'),
                    );
                  } else {
                    handleCreateTransaction(context, viewModel, 2);
                  }
                },
              ),
            ),
            SizedBox(width: context.edgeSize),
            Visibility(
              visible: redeemDoubleAmount > 0 ? true : false,
              child: Flexible(
                child: CSButton(
                  label: tr('asset:lbl_redemption_button'),
                  onPressed: () {
                    handleCreateTransaction(context, viewModel, 3);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleCreateTransaction(
    BuildContext context,
    AssetWithdrawVM viewModel,
    int isTouFlag,
  ) {
    assemblyTransaction(isTouFlag);
    showPasswordDialog(
      context,
      (password) => viewModel.doUnlockWallet(password),
      (walletData, _) async {
        WalletActionMNTTxSubmit.reduceDpos(txData, walletData.mnemonic!)
            .then((res) {
          AssetRepository()
              .submitTransaction(hex: res.toString())
              .then((hexRes) {
            //Delay refreshing data
            Future.delayed(Duration(milliseconds: 2000), () {
              //Update balances list
              TradeHomeVM.activeStore?.dispatchAsync(
                AssetActionUpdateWalletBalances(
                  wallet: viewModel.activeWallet!,
                ),
              );
            });
            AppNavigator.goBack();
          });
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      superNodeAddress = widget.voteNodeItem['address'].toString();
      superNodeName = widget.voteNodeItem['name'].toString();
    });

    getVoteAddress();
    getRedeemAddress();
    fetchNosData();
    getAvailableAmount();
    getInvestedAmount();
    getRedeemAmount();
    fetchWithdrawalNosData();
    fetchRedeemNosData();
  }

  void assemblyTransaction(int isTouFlag) {
    dynamic fromAddress;
    dynamic toAddress;
    dynamic nonceCount;
    dynamic data;
    String amount = '';
    String gaslimit = '';

    if (isTouFlag == 1) {
      fromAddress = widget.coinInfo.address;
      toAddress = nodeAddress;
      nonceCount = nonce;
      gaslimit = '20000';
      data = '01010146$hex';
      amount = myController.text;
    } else if (isTouFlag == 2) {
      fromAddress = nodeAddress;
      toAddress = redeemAddress;
      nonceCount = nonceWithdrawal;
      data = '01010129$hexRedeem';
      gaslimit = '20000';
      //data = '00';
      if (myController.text.isNotEmpty) {
        if (double.parse(myController.text) == double.parse(investedAmount)) {
          amount = (double.parse(myController.text) - 0.02).toString();
        } else if ((double.parse(myController.text) + 0.01) ==
            double.parse(investedAmount)) {
          amount = (double.parse(myController.text) - 0.01).toString();
        } else {
          amount = myController.text;
        }
      }
    } else if (isTouFlag == 3) {
      fromAddress = redeemAddress;
      toAddress = widget.coinInfo.address;
      nonceCount = nonceRedeem;
      gaslimit = '10000';
      data = '00';
      amount = redeemAmount;
      //amount = myController.text;
    }

    final time = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toInt();
    final params = {
      'time': time,
      'fork': AppConstants.mnt_fork,
      'nonce': nonceCount,
      'from': fromAddress,
      'to': toAddress,
      'amount': amount,
      'gasprice': '1000000000000',
      'gaslimit': gaslimit,
      'data': data,
    };
    final ret = getTx(params as Map<String, Object>);
    setState(() {
      txData = ret;
    });
  }

  //get vote address
  void getVoteAddress() {
    final ret = getVote(
      widget.voteNodeItem['address'].toString(),
      widget.coinInfo.address.toString(),
      0,
    );
    setState(() {
      nodeAddress = ret['address'].toString();
      hex = ret['hex'].toString();
    });
  }

  //get Redeem address
  void getRedeemAddress() {
    final ret = getRedeem(widget.coinInfo.address.toString(), 0);
    setState(() {
      redeemAddress = ret['address'].toString();
      hexRedeem = ret['hex'].toString();
    });
  }

  //Get compound interest address
  // void getCompoundInterestAddress() {
  //   final ret = getVote(widget.voteNodeItem['address'].toString(),
  //       widget.coinInfo.address.toString(), 0);
  //   setState(() {
  //     compoundInterestAddress = ret['address'].toString();
  //   });
  // }

  // get nonce
  void fetchNosData() async {
    var res = await AssetRepository().getTransactionFee(
        address: widget.coinInfo.address.toString(), symbol: '');
    setState(() {
      nonce = res?['nonce'] + 1;
      //gas_price = res['gas_price'];
      //gas_limit = res['gas_limit'];
    });
  }

  // Withdrawal nonce
  void fetchWithdrawalNosData() async {
    var res = await AssetRepository()
        .getTransactionFee(address: nodeAddress, symbol: '');
    setState(() {
      nonceWithdrawal = res?['nonce'] + 1;
    });
  }

  // Withdrawal nonce
  void fetchRedeemNosData() async {
    var res = await AssetRepository()
        .getTransactionFee(address: redeemAddress, symbol: '');
    setState(() {
      nonceRedeem = res?['nonce'] + 1;
    });
  }

// get Available voting amount
  void getAvailableAmount() async {
    final apiBalance = await AssetRepository().getCoinBalance(
      chain: widget.coinInfo.chain.toString(),
      symbol: widget.coinInfo.symbol.toString(),
      address: widget.coinInfo.address.toString(),
      contract: '',
    );

    setState(() {
      addressBalance = NumberUtil.getFixed(apiBalance['balance'].toString(), 6);
    });
  }

  // get investedAmount
  void getInvestedAmount() async {
    final apiBalance = await AssetRepository().getCoinBalance(
      chain: widget.coinInfo.chain.toString(),
      symbol: widget.coinInfo.symbol.toString(),
      address: nodeAddress,
      contract: '',
    );

    setState(() {
      investedAmount =
          Decimal.parse(apiBalance['balance'].toString()).toStringAsFixed(6);
    });
  }

  // get RedeemAmount
  void getRedeemAmount() async {
    final apiBalance = await AssetRepository().getCoinBalance(
      chain: widget.coinInfo.chain.toString(),
      symbol: widget.coinInfo.symbol.toString(),
      address: redeemAddress,
      contract: '',
    );

    setState(() {
      locked = NumberUtil.getFixed(apiBalance['locked'].toString(), 6);
      withdrawalAmount =
          NumberUtil.getFixed(apiBalance['balance'].toString(), 6);

      double douBalance = double.parse(apiBalance['balance'].toString());
      if (douBalance <= 0) {
        redeemDoubleAmount = 0;
      } else {
        redeemDoubleAmount =
            douBalance - double.parse(apiBalance['unconfirmed'].toString());
      }

      redeemAmount = (double.parse(apiBalance['balance'].toString()) - 0.01)
          .toStringAsFixed(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final copied = useState('');
    final formKey = GlobalKey<FormState>();
    return CSScaffold(
      scrollable: true,
      title: tr('asset:lbl_vote_detail'),
      child: StoreConnector<AppState, AssetWithdrawVM>(
        distinct: true,
        converter: AssetWithdrawVM.fromStore,
        onInitialBuild: (_, __, viewModel) {},
        builder: (context, viewModel) => Column(
          children: [
            Form(
              key: formKey,
//              autovalidateMode: autovalidate.value
//                  ? AutovalidateMode.onUserInteraction
//                  : AutovalidateMode.disabled,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//                   AssetCoinBox(
// //                    title: tr('asset:withdraw_lbl_coin'),
//                     title: tr('asset:lbl_vote_currency'),
//                     coinInfo: null,
//                   ),
                  FormBox(
                    type: FormBoxType.inputText,
//                    title: tr('asset:withdraw_lbl_address'),
                    title: tr('asset:super_node_address'), //超级节点地址
                    hintText: tr(superNodeAddress),
                    // iconName: CSIcons.Scan,
                    // iconColor: context.bodyColor,
                    readOnly: true,
                    onPressIcon: () {
//                      handleOpenAddressScan(viewModel);
                    },
//                    controller: address,
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButton(
                        // label: tr('asset:withdraw_btn_address'),
                        height: 30,
                        textStyle: context
                            .textBody(
                              color: context.placeholderColor,
                              bold: true,
                              fontWeight: FontWeight.normal,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        autoWidth: true,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ),
                    maxLines: null,
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {
//                        handleChangeAddress(viewModel);
                      }
                    },
                  ),
                  FormBox(
                    //超级节点名称
                    type: FormBoxType.inputText,
//                    title: tr('asset:withdraw_lbl_address'),
                    title: tr('asset:super_node_name'),
                    // iconName: CSIcons.Scan,
                    // iconColor: context.bodyColor,
                    readOnly: true,
                    onPressIcon: () {
//                      handleOpenAddressScan(viewModel);
                    },
//                    controller: address,
                    hintText: tr(superNodeName),
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButton(
                        // label: tr('asset:withdraw_btn_address'),
                        height: 30,
                        textStyle: context
                            .textBody(
                              color: context.placeholderColor,
                              bold: true,
                              fontWeight: FontWeight.normal,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        autoWidth: true,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ),
                    maxLines: null,
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {
//                        handleChangeAddress(viewModel);
                      }
                    },
                  ),
                  FormBox(
                    type: FormBoxType.inputText,
                    title: tr('asset:amount_of_votes'),
                    readOnly: true,
                    onPressIcon: () {},
                    hintText: addressBalance,
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButton(
                        height: 30,
                        textStyle: context
                            .textBody(
                              color: context.placeholderColor,
                              bold: true,
                              fontWeight: FontWeight.normal,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        autoWidth: true,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ),
                    maxLines: null,
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {
                        //handleChangeAddress(viewModel);
                      }
                    },
                  ),
                  //Invested amount
                  FormBox(
                    type: FormBoxType.inputText,
                    title: tr('asset:amount_of_amountvoted'),
                    readOnly: true,
                    onPressIcon: () {},
                    hintText: tr(investedAmount),
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButton(
                        height: 30,
                        textStyle: context
                            .textBody(
                              color: context.placeholderColor,
                              bold: true,
                              fontWeight: FontWeight.normal,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        autoWidth: true,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ),
                    maxLines: null,
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {}
                    },
                  ),
                  //locked amount
                  FormBox(
                    type: FormBoxType.inputText,
                    title: tr('asset:amount_of_lock_redemption'),
                    readOnly: true,
                    onPressIcon: () {},
                    hintText: tr(locked),
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButton(
                        height: 30,
                        textStyle: context
                            .textBody(
                              color: context.placeholderColor,
                              bold: true,
                              fontWeight: FontWeight.normal,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        autoWidth: true,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ),
                    maxLines: null,
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {}
                    },
                  ),
                  FormBox(
                    type: FormBoxType.inputText,
                    title: tr('asset:amount_of_redeemable'),
                    readOnly: true,
                    onPressIcon: () {},
                    hintText: tr(redeemDoubleAmount.toString()),
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButton(
                        height: 30,
                        textStyle: context
                            .textBody(
                              color: context.placeholderColor,
                              bold: true,
                              fontWeight: FontWeight.normal,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        autoWidth: true,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ),
                    maxLines: null,
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {}
                    },
                  ),
                  FormBox(
                    type: FormBoxType.inputText,
                    title: tr('asset:compound_interest_address'),
                    readOnly: true,
                    hintText: tr(nodeAddress),
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButtonIcon(
                        size: 18,
                        borderRadius: 4,
                        icon: CSIcons.Copy,
                        padding: EdgeInsets.all(0),
                        containerSize: 20,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          copyTextToClipboard(tr(nodeAddress));
                          Toast.show(tr('global:msg_copy_success'));
                        },
                      ),
                    ),
                    maxLines: null,
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {}
                    },
                  ),
                  FormBox(
                    type: FormBoxType.inputNumber,
//                    title: tr('asset:withdraw_lbl_amount'),
                    title: tr('asset:lbl_vote_number'),
                    maxLength: 25,
                    controller: myController,
                    validator: RequiredValidator(
                      errorText: tr('asset:defi_vote_number'),
                    ),
                    // inputFormatters: [
                    //   DecimalTextInputFormatter(
                    //     decimalRange: coinInfo.chainPrecision,
                    //   ),
                    // ],
                    //  iconName: CSIcons.All,
                    iconSize: 27,
                    onPressIcon: () {
//                      handleWithdrawAll(viewModel);
                    },
                    hintText: tr('asset:defi_vote_number'),
                    onFocusChanged: (hasFocus) {
                      if (!hasFocus) {}
                    },
                  ),
                  FormBox(
                      type: FormBoxType.inputText,
                      title: tr('asset:gas_free'),
                      iconColor: context.bodyColor,
                      hintText: tr('0.02'),
                      maxLines: null,
                      readOnly: true)
                ],
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: context.edgeAll20,
              child: Text(
                tr('asset:withdraw_msg_attention'),
                style: context.textSecondary(
                  color: context.redColor,
                  bold: true,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            buildFooter(context, viewModel),
          ],
        ),
      ),
    );
  }
}
