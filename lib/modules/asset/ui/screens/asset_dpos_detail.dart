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
  String compoundInterestAddress = '';
  String superNodeAddress = '';
  String superNodeName = '';
  String addressBalance = '';
  String locked = '';
  String investedAmount = '';
  String withdrawalAmount = '';
  dynamic nonce;
  dynamic nonceWithdrawal;
  //dynamic gas_price;
  //dynamic gas_limit;
  dynamic status = 1;
  dynamic txData;
  final myController = TextEditingController();
  late String hex;
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
                  handleCreateTransaction(context, viewModel, true);
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
                  var l1 = double.parse(investedAmount);
                  if (l1 > 0) {
                    handleCreateTransaction(context, viewModel, false);
                  } // else {
                  //null;
                  //}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleCreateTransaction(
      BuildContext context, AssetWithdrawVM viewModel, bool isTou) {
    assemblyTransaction(isTou);
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
    getCompoundInterestAddress();
    fetchNosData();
    getAvailableAmount();
    getInvestedAmount();
    fetchWithdrawalNosData();
  }

  void assemblyTransaction(bool isTou) {
    // bool isTou = true;
    dynamic address;
    if (status == 1) {
      address = nodeAddress;
    } else {
      address = compoundInterestAddress;
    }
    final time = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toInt();
    final params = {
      'time': time,
      'fork': AppConstants.mnt_fork,
      'nonce': isTou ? nonce : nonceWithdrawal,
      'from': isTou ? widget.coinInfo.address : address,
      'to': isTou ? address : widget.coinInfo.address,
      'amount': myController.text,
      'gasprice': '1000000000000',
      'gaslimit': '20000',
      'data': isTou ? '01010146$hex' : '00',
    };
    final ret = getTx(params as Map<String, Object>);
    setState(() {
      txData = ret;
    });
  }

  //get vote address
  void getVoteAddress() {
    final ret = getVote(widget.voteNodeItem['address'].toString(),
        widget.coinInfo.address.toString(), 1);
    setState(() {
      nodeAddress = ret['address'].toString();
      hex = ret['hex'].toString();
    });
  }

  //Get compound interest address
  void getCompoundInterestAddress() {
    final ret = getVote(widget.voteNodeItem['address'].toString(),
        widget.coinInfo.address.toString(), 0);
    setState(() {
      compoundInterestAddress = ret['address'].toString();
    });
  }

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
      investedAmount = (Decimal.parse(apiBalance['balance'].toString()) +
              Decimal.parse(apiBalance['locked'].toString()))
          .toStringAsFixed(6);
      locked = NumberUtil.getFixed(apiBalance['locked'].toString(), 6);
      withdrawalAmount =
          NumberUtil.getFixed(apiBalance['balance'].toString(), 6);
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
                    title: tr('asset:amount_of_locked'),
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
                    title: tr('asset:amount_of_withdrawal'),
                    readOnly: true,
                    onPressIcon: () {},
                    hintText: tr(withdrawalAmount),
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
                      hintText: tr('0.000001'),
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
