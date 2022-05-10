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
  String addressBalance;
  dynamic nonce;
  //dynamic gas_price;
  //dynamic gas_limit;
  dynamic status = 1;
  dynamic txData;
  final myController = TextEditingController();
  String hex;
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
                  handleCreateTransaction(context, viewModel, false);
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
        WalletActionMNTTxSubmit.reduceDpos(txData, walletData.mnemonic)
            .then((res) {
          //print('ddd $res');
          AssetRepository()
              .submitTransaction(hex: res.toString())
              .then((hexRes) => {AppNavigator.goBack()});
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
      addressBalance = widget.coinInfo.balance.toString();
    });
    getVoteAddress();
    getCompoundInterestAddress();
    fetchNosData();
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
      'nonce': nonce,
      'from': isTou ? widget.coinInfo.address : address,
      'to': isTou ? address : widget.coinInfo.address,
      'amount': myController.text,
      'gasprice': '10000',
      'gaslimit': '20000',
      'data': '01010146$hex'
    };
    final ret = getTx(params);
    setState(() {
      txData = ret;
    });
  }

  //获取投票地址
  void getVoteAddress() {
    print('ddddd ${widget.coinInfo} ${widget.voteNodeItem}');
    final ret = getVote(widget.voteNodeItem['address'].toString(),
        widget.coinInfo.address.toString(), 1);
    setState(() {
      nodeAddress = ret['address'].toString();
      hex = ret['hex'].toString();
    });
  }

  //获取复利地址
  void getCompoundInterestAddress() {
    final ret = getVote(widget.voteNodeItem['address'].toString(),
        widget.coinInfo.address.toString(), 0);
    setState(() {
      compoundInterestAddress = ret['address'].toString();
    });
  }

  // 获取nonce
  void fetchNosData() async {
    var res = await AssetRepository().getTransactionFee(
        address: widget.coinInfo.address.toString(), symbol: '');
    setState(() {
      nonce = res['nonce'] + 1;
      //gas_price = res['gas_price'];
      //gas_limit = res['gas_limit'];
    });
    print('获取的nonce $res');
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return CSScaffold(
      scrollable: true,
      title: tr('asset:lbl_vote_detail'),
      child: StoreConnector<AppState, AssetWithdrawVM>(
        distinct: true,
        converter: AssetWithdrawVM.fromStore,
        onInitialBuild: (viewModel) {},
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
                            .textBody(color: context.placeholderColor)
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
                    title: tr('asset:super_node_name'), //超级节点地址
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
                            .textBody(color: context.placeholderColor)
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
//                    title: tr('asset:withdraw_lbl_address'),
                    title: tr('asset:amount_of_votes'), //投票金额
                    // iconName: CSIcons.Scan,
                    // iconColor: context.bodyColor,
                    readOnly: true,
                    onPressIcon: () {
//                      handleOpenAddressScan(viewModel);
                    },
//                    controller: address,
                    hintText: tr(addressBalance),
                    titleAction: Transform.translate(
                      offset: Offset(context.edgeSize, 0),
                      child: CSButton(
                        // label: tr('asset:withdraw_btn_address'),
                        height: 30,
                        textStyle: context
                            .textBody(color: context.placeholderColor)
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
//
                  Center(
                    child: Container(
                        width: 390,
                        decoration: new BoxDecoration(
                          color: context.bgPrimaryColor,
                          borderRadius:
                              new BorderRadius.circular((12.0)), // 圆角度
                        ),
                        child: Column(
                          children: [
                            RadioListTile(
                                //投票地址
                                value: 1,
                                onChanged: (value) {
                                  setState(() {
                                    this.status = value;
                                  });
                                },
                                groupValue: this.status,
                                // title: Text("asset:lbl_vote_address"),
                                title: Text(tr('asset:lbl_vote_address')),
                                subtitle: Text(nodeAddress),
                                selected: this.status == 1,
                                activeColor: Colors.yellow),
                            RadioListTile(
                                //复利地址
                                value: 0,
                                onChanged: (value) {
                                  setState(() {
                                    this.status = value;
                                  });
                                },
                                groupValue: this.status,
                                title:
                                    Text(tr('asset:compound_interest_address')),
                                subtitle: Text(compoundInterestAddress),
                                selected: this.status == 0,
                                activeColor: Colors.yellow),
                          ],
                        )),
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
                style: context.textSecondary(color: context.redColor),
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
