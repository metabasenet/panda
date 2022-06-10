part of invest_ui_module;

class MiningInvitationTab extends HookWidget {
  const MiningInvitationTab({
    required this.listData,
    required this.doLoadData,
    required this.coinInfo,
    Key? key,
  }) : super(key: key);

  final AssetCoin coinInfo;
  final List<ProfitInvitationItem> listData;
  final Future<int> Function(
      {required bool isRefresh,
      required int skip,
      required int take}) doLoadData;

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
          Text('${tr('invest:mining_record_lbl_amount')} : ${item.amount} MNT',
              style: context.textBody(
                bold: true,
                fontWeight: FontWeight.normal,
              )),
          SizedBox(height: context.edgeSizeHalf),
          Text(
            '${tr('invest:mining_record_lbl_height')} : ${item.height}  ${tr('invest:mining_record_lbl_time')} : ${item.time}',
            style: context.textSmall(
              bold: true,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: context.edgeSizeHalf),
          Text(
            '${tr('invest:mining_record_lbl_address')} : ${StringUtils.strCut(item.address, startKeep: 17, endKeep: 17)}',
            style: context.textSmall(
              bold: true,
              fontWeight: FontWeight.normal,
            ),
          ),
          //SizedBox(height: 4 /*context.edgeSize*/),
        ],
      ),
    );
  }
}

class MiningProfitTab extends HookWidget {
  const MiningProfitTab({
    required this.listData,
    required this.doLoadData,
    required this.coinInfo,
    Key? key,
  }) : super(key: key);

  final AssetCoin coinInfo;
  final List<ProfitRecordItem> listData;
  final Future<int> Function(
      {required bool isRefresh,
      required int skip,
      required int take}) doLoadData;

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
              skip: 0,
              take: 1000,
            );
          },
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return buildItem(context, listData[index], index);
          }),
    );
  }

  Widget buildItem(BuildContext context, ProfitRecordItem item, int index) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //if (index != 0) Divider(color: context.greyColor),
          SizedBox(height: context.edgeSize),
          Text(
            '${tr('invest:mining_record_lbl_totalprofit')} : ${NumberUtil.getFixed(item.balance, 6)}',
            style: context.textBody(
              bold: true,
              fontWeight: FontWeight.normal,
            ),
          ),
          //SizedBox(height: context.edgeSize),
          SizedBox(height: context.edgeSizeHalf),
          Text(
            '${tr('invest:mining_record_lbl_votingprofit')} : ${NumberUtil.getFixed(item.vote, 6)}  ${tr('invest:mining_record_lbl_Promotionprofit')} : ${NumberUtil.getFixed(item.extend, 6)}',
            style: context.textSmall(
              bold: true,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: context.edgeSizeHalf),
          Text(
              '${tr('invest:mining_record_lbl_height')} : ${item.height}  ${tr('invest:mining_record_lbl_time')} : ${item.time}',
              style: context.textSmall(
                bold: true,
                fontWeight: FontWeight.normal,
              )),
        ],
      ),
    );
  }
}
