part of invest_ui_module;

class MiningInvitationTab extends HookWidget {
  const MiningInvitationTab({
    @required this.listData,
    @required this.doLoadData,
    @required this.coinInfo,
    Key key,
  }) : super(key: key);

  final AssetCoin coinInfo;
  final List<ProfitInvitationItem> listData;
  final Future<int> Function({bool isRefresh, int skip, int take}) doLoadData;

  @override
  Widget build(BuildContext context) {
    final request = useBehaviorStreamController<CSListViewParams>();

    useEffect(() {
      request.add(CSListViewParams());
      return null;
    }, []);

    return Expanded(
      child: CSListViewStream(
          requestStream: request,
          decoration: context.boxDecorationOnlyBottom(),
          margin: context.edgeAll.copyWith(top: 0),
          padding: context.edgeAll,
          onLoadData: (params) {
            return doLoadData(
              isRefresh: params.isRefresh,
              skip: params.skip,
              take: 10,
            );
          },
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return buildItem(context, listData[index], index);
          } /*,
        emptyWidget: CSEmpty(
          label: tr('invitation:list_empty_tips'),
          showButton: true,
          heightFromTop: 30,
          imageUrl: 'assets/images/empty_record.png',
          btnText: tr('invitation:defi_create_title'),
          onPressed: () {
            //InvitationCreatePage.open(coinInfo);
          },
        ),*/
          ),
    );
  }

  Widget buildItem(BuildContext context, ProfitInvitationItem item, int index) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //if (index != 0) Divider(color: context.greyColor),
          SizedBox(height: context.edgeSize),
          Text('amount : ${item.amount} MNT', style: context.textBody()),
          SizedBox(height: context.edgeSizeHalf),
          Text(
            'height : ${item.height} . time : ${item.time}',
            style: context.textSmall(),
          ),
          SizedBox(height: context.edgeSize),
          Text(
            'address : ${StringUtils.strCut(item.address, startKeep: 17, endKeep: 17)}',
            style: context.textSmall(),
          ),
          //SizedBox(height: 4 /*context.edgeSize*/),
        ],
      ),
    );
  }
}

class MiningProfitTab extends HookWidget {
  const MiningProfitTab({
    @required this.listData,
    @required this.doLoadData,
    @required this.coinInfo,
    Key key,
  }) : super(key: key);

  final AssetCoin coinInfo;
  final List<ProfitRecordItem> listData;
  final Future<int> Function({bool isRefresh, int skip, int take}) doLoadData;

  @override
  Widget build(BuildContext context) {
    final request = useBehaviorStreamController<CSListViewParams>();

    useEffect(() {
      request.add(CSListViewParams());
      return null;
    }, []);

    return Expanded(
      child: CSListViewStream(
          requestStream: request,
          decoration: context.boxDecorationOnlyBottom(),
          margin: context.edgeAll.copyWith(top: 0),
          padding: context.edgeAll,
          onLoadData: (params) {
            return doLoadData(
              isRefresh: params.isRefresh,
              skip: params.skip,
              take: 10,
            );
          },
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return buildItem(context, listData[index], index);
          }
          /*,
        emptyWidget: CSEmpty(
          label: tr('invitation:list_empty_tips'),
          showButton: true,
          heightFromTop: 30,
          imageUrl: 'assets/images/empty_record.png',
          btnText: tr('invitation:defi_create_title'),
          onPressed: () {
            //InvitationCreatePage.open(coinInfo);
          },
        ),*/
          ),
    );
  }

  Widget buildItem(BuildContext context, ProfitRecordItem item, int index) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index != 0) Divider(color: context.greyColor),
          SizedBox(height: context.edgeSize),
          Text('height : ${item.height}. balance : ${item.balance}',
              style: context.textBody()),
          SizedBox(height: context.edgeSizeHalf),
          Text(
            '投票收益 : ${item.stakeReward}.',
            style: context.textSmall(),
          ),
          SizedBox(height: context.edgeSize),
          Text(
            '推广收益 : ${item.promotionReward}.',
            style: context.textSmall(),
          ),
          SizedBox(height: 4 /*context.edgeSize*/),
        ],
      ),
    );
  }
}
