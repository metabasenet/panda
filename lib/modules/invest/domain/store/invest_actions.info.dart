part of invest_domain_module;

class InvestActionGetProfitRecordList extends _BaseAction {
  InvestActionGetProfitRecordList({
    @required this.isRefresh,
    @required this.take,
    @required this.skip,
  });

  final bool isRefresh;
  final int take;
  final int skip;

  @override
  Future<AppState> reduce() async {
    final activeMint = store.state.investState.activeMint;
    final coin = store.state.walletState.activeWallet.addresses
        .where((element) => element.chain == AppConstants.mnt_chain)
        .first;

    final result = await InvestRepository().getProfitRecordList(
      fork: activeMint.forkId,
      address: coin.address,
      take: take,
      skip: skip,
    );

    final data = deserializeListOf<ProfitRecordItem>(result);
    return state.rebuild(
      (a) => a.investState.profitRecordList.replace(data),
    );
  }
}

/// 邀请人列表
class InvestActionGetInvitationList extends _BaseAction {
  InvestActionGetInvitationList({
    this.isRefresh,
    this.take,
    this.skip,
  });

  final bool isRefresh;
  final int take;
  final int skip;

  @override
  Future<AppState> reduce() async {
    final activeMint = store.state.investState.activeMint;
    final coin = store.state.walletState.activeWallet.addresses
        .where((element) => element.chain == AppConstants.mnt_chain)
        .first;

    final result = await InvestRepository().getProfitInvitationList(
      fork: activeMint.forkId,
      addr: coin.address,
      take: take,
      skip: skip,
    );

    final data = deserializeListOf<ProfitInvitationItem>(result);

    return state.rebuild(
      (a) => a.investState.profitInvitationList.replace(data),
    );
  }
}
