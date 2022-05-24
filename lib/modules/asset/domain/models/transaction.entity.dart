part of asset_domain_module;

final kTransactionChainConfirmations = {
  'ETH': 12,
  'BTC': 3,
  AppConstants.mnt_chain: 1,
  'TRX': 1,
};

/// Type of this wallet (used to generate address)
@HiveType(typeId: kHiveTypeTransactionType)
enum TransactionType {
  @HiveField(0)
  deposit,

  @HiveField(1)
  withdraw,

  @HiveField(2)
  contractCall,

  @HiveField(3)
  approveCall,
}

@HiveType(typeId: kHiveTypeTransaction)
class Transaction extends HiveObject {
  Transaction() {
    contract = '';
  }

  factory Transaction.fromBtcTx(
    String symbol,
    String fromAddress, //自己的地址
    Map<String, dynamic> data,
  ) {
    final balanceDiff =
        NumberUtil.getIntAmountAsDouble(data['balance_diff'], 8);

    final isWithdraw = balanceDiff < 0;

    final inList =
        (data['inputs'] as List).map((e) => e['prev_addresses'][0]).toList();

    var outList = (data['outputs'] as List)
        .where((e) => !inList.contains('${e['addresses'][0]}'))
        .map((e) => e['addresses'][0])
        .toList();

    outList = outList == null || outList.isEmpty ? inList : outList;

    final inFirst = '${inList[0] ?? ''}';
    final outFirst = '${outList[0] ?? ''}';

    return Transaction()
      ..txId = data['hash'].toString()
      ..chain = 'BTC'
      ..symbol = symbol
      ..fromAddress = isWithdraw ? fromAddress : inFirst
      ..toAddress = isWithdraw ? outFirst : fromAddress
      ..timestamp = NumberUtil.getInt(data['block_time'])
      ..confirmations = NumberUtil.getInt(data['confirmations'])
      ..fee = NumberUtil.getIntAmountAsDouble(data['fee'], 8)
      ..feeSymbol = symbol
      ..type = isWithdraw ? TransactionType.withdraw : TransactionType.deposit
      ..amount = balanceDiff.abs();
  }

  factory Transaction.fromEthTx(
    String symbol,
    String fromAddress,
    int precision,
    Map<String, dynamic> data,
  ) {
    final gas = NumberUtil.multiply<double>(data['gasPrice'], data['gasUsed']);
    final feeUsed = NumberUtil.getIntAmountAsDouble(gas ?? 0);
    // final feeEstimated = WalletFeeUtils.getETHFeeValue(
    //   gasLimit: NumberUtil.getInt(data['gas']),
    //   gasPrice: NumberUtil.getInt(data['gasPrice']),
    //   chainPrecision: precision,
    // );
    final amount = data['amount'] != null
        ? NumberUtil.getDouble(data['amount'])
        : NumberUtil.getIntAmountAsDouble(data['value'] ?? 0, precision);

    return Transaction()
      ..txId = data['hash'].toString()
      ..chain = 'ETH'
      ..symbol = symbol
      ..fromAddress = data['from'].toString()
      ..toAddress = data['to'].toString()
      ..timestamp = NumberUtil.getInt(data['timeStamp'])
      ..blockHeight = NumberUtil.getInt(data['blockNumber'])
      ..confirmations =
          NumberUtil.getInt(data['confirmations'] ?? data['confirmed'])
      ..fee = feeUsed
      ..feeSymbol = 'ETH' //eth 链的手续费 都是扣 eth 包括ERC20
      ..type =
          fromAddress.toLowerCase() == data['from'].toString().toLowerCase()
              ? TransactionType.withdraw
              : TransactionType.deposit
      ..failed = data['isError']?.toString() == '1' ||
          data['status']?.toString() == '0x0'
      ..amount = amount;
  }

  factory Transaction.fromTrxTx(
    String symbol,
    String fromAddress,
    Map<String, dynamic> data,
  ) {
    final amount =
        data['type'] == 'Approval' ? 0.0 : NumberUtil.getDouble(data['value']);

    final fee = data['receipt'] != null
        ? NumberUtil.getIntAmountAsDouble(data['receipt']['fee'], 6)
        : 0.0;

    return Transaction()
      ..txId = (data['transaction_id'].toString().isEmpty)
          ? data['txID'].toString()
          : data['transaction_id'].toString()
      ..chain = 'TRX'
      ..symbol = symbol
      ..fromAddress = data['from'].toString()
      ..toAddress = data['to'].toString()
      ..timestamp = data['block_timestamp'] != null
          ? NumberUtil.getInt(data['block_timestamp']) ~/ 1000
          : NumberUtil.getInt(data['timestamp'])
      ..blockHeight = NumberUtil.getInt(data['block_number'] ?? data['block'])
      ..confirmations = NumberUtil.getInt(data['confirmed'], 1)
      ..failed = data['status'] == 'failed'
      ..fee = fee
      ..feeSymbol = 'TRX'
      ..type = data['type'] == 'Approval'
          ? TransactionType.approveCall
          : fromAddress.toLowerCase() == data['from'].toString().toLowerCase()
              ? TransactionType.withdraw
              : TransactionType.deposit
      ..amount = amount;
  }

  factory Transaction.fromJson({
    required String chain,
    required String symbol,
    required String fromAddress,
    required int chainPrecision,
    required Map<String, dynamic> json,
  }) {
    switch (chain) {
      case AppConstants.mnt_chain:
        return Transaction.fromMntTx(symbol, fromAddress, json);
      case 'ETH':
        return Transaction.fromEthTx(symbol, fromAddress, chainPrecision, json);
      case 'TRX':
        return Transaction.fromTrxTx(symbol, fromAddress, json);
      default:
        return Transaction.fromTrxTx(symbol, fromAddress, json);
    }
  }

  factory Transaction.fromMntTx(
    String symbol,
    String fromAddress,
    Map<String, dynamic> data,
  ) =>
      Transaction()
        ..txId = data['hash'].toString()
        ..chain = AppConstants.mnt_chain
        ..symbol = symbol
        ..fromAddress = data['fromAddress'].toString()
        ..toAddress = data['toAddress'].toString()
        ..timestamp = NumberUtil.getInt(data['timestamp'])
        ..confirmations = NumberUtil.getInt(data['confirmed'])
        ..fee = double.tryParse(data['txFee'].toString()) ?? 0
        ..feeSymbol = symbol
        ..type = fromAddress.toLowerCase() ==
                data['fromAddress'].toString().toLowerCase()
            ? TransactionType.withdraw
            : TransactionType.deposit
        ..amount = double.tryParse(data['amount'].toString()) ?? 0;

  factory Transaction.fromSubmit({
    required WithdrawSubmitParams params,
    required String txId,
  }) =>
      Transaction()
        ..txId = txId
        ..chain = params.withdrawData.chain
        ..symbol = params.withdrawData.symbol
        ..fromAddress = params.withdrawData.fromAddress
        ..toAddress = params.toAddress
        ..timestamp = SystemDate.getTime()
        ..confirmations = 0
        ..fee = params.withdrawData.fee.feeValue
        ..feeSymbol = params.withdrawData.fee.feeSymbol
        ..type = TransactionType.withdraw
        ..amount = params.amount;

  factory Transaction.fromRaw({
    required String txId,
    required String chain,
    required String symbol,
    required String toAddress,
    required String fromAddress,
    required double feeValue,
    required String feeSymbol,
    required double amount,
    required TransactionType type,
  }) =>
      Transaction()
        ..txId = txId
        ..chain = chain
        ..symbol = symbol
        ..fromAddress = fromAddress
        ..toAddress = toAddress
        ..timestamp = SystemDate.getTime()
        ..confirmations = 0
        ..fee = feeValue
        ..feeSymbol = feeSymbol
        ..type = type
        ..amount = amount;

  @HiveField(0)
  late String txId;
  @HiveField(1)
  late String chain;
  @HiveField(2)
  late String symbol;
  @HiveField(3)
  late int confirmations;
  @HiveField(4)
  late int timestamp;
  @HiveField(5)
  late int blockHeight;
  @HiveField(6)
  late bool failed;

  @HiveField(7)
  late String toAddress;
  @HiveField(8)
  late String fromAddress;

  @HiveField(9)
  late double amount;
  @HiveField(10)
  late double fee;
  @HiveField(11)
  late String feeSymbol;

  /// ETH: Token contract
  /// MNT: Fork ID/TX
  @HiveField(12)
  late String contract;

  @HiveField(13)
  late TransactionType type;

  String get displayTime => formatDate(
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
      );

  String get displayAmount => NumberUtil.truncateDecimal<String>(amount);

  String get displayAmountWithSign => amount == 0
      ? displayAmount
      : isOutput
          ? '-$displayAmount'
          : '+$displayAmount';

  /// If true, ETH tx failed
  bool get isFailed => failed == true;

  bool get isOutput =>
      type == TransactionType.withdraw ||
      type == TransactionType.contractCall ||
      type == TransactionType.approveCall;

  /// 资产记录24小时以后还是在确认中
  bool get isExpired =>
      isConfirmed == false &&
      !isFailed &&
      (SystemDate.getTime() - timestamp) > 24 * 60 * 60;

  bool get isTakingLongTime =>
      isConfirmed == false &&
      !isFailed &&
      (SystemDate.getTime() - timestamp) > 5 * 60;

  /// If true, TX is confirmermed, reached the minimum Confirmation
  bool get isConfirmed =>
      confirmations >= (kTransactionChainConfirmations[chain] ?? 0);

  bool get isConfirming =>
      confirmations <= (kTransactionChainConfirmations[chain] ?? 0);

  String get confirmingTransKey {
    if (isFailed) {
      return 'asset:trans_msg_tx_failed'; // 失败
    }
    if (isConfirmed) {
      return 'asset:trans_msg_tx_success'; //已完成
    }
    return '$confirmations/${kTransactionChainConfirmations[chain]}'; //确认中
  }

  String get statusTransKey {
    if (isFailed) {
      return 'asset:trans_msg_tx_failed'; // 失败
    }
    if (confirmations > 0) {
      return 'asset:trans_msg_tx_success'; //已完成
    }
    return 'asset:trans_msg_tx_pending'; //确认中
  }

  String get typeTransKey {
    if (type == TransactionType.approveCall) {
      return 'asset:trans_type_contract_approve';
    }
    if (type == TransactionType.contractCall || amount == 0) {
      return 'asset:trans_type_contract_call';
    }
    if (type == TransactionType.deposit) {
      return 'asset:trans_type_deposit';
    }
    return 'asset:trans_type_withdraw';
  }
}
