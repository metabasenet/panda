part of asset_ui_module;

class TransDropItem extends StatefulWidget {
  const TransDropItem({
    required this.item,
    required this.coinInfo,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final item;
  final coinInfo;
  final onChanged;

  @override
  State<StatefulWidget> createState() {
    return _TransDropWidget();
  }
}

class _TransDropWidget extends State<TransDropItem> {
  @override
  Widget build(BuildContext context) {
    return CSContainer(
      secondary: true,
      margin: context.edgeTop,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: context.edgeSize),
      onTap: () => {
        // print("点击了${widget.coinInfo}")
        AppNavigator.push('/asset/dpos/detail', params: {
          'voteNodeItem': widget.item,
          'coinInfo': widget.coinInfo
        }).then((val) => {widget.onChanged()})
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(widget.item['name'].toString()),
                      style: context.textMedium(
                        bold: true,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      NumberUtil.getFixed(widget.item['votes'].toString(), 6),
                      style: context.textSmall(
                        bold: true,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ]),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(6),
            decoration: context.boxDecoration(
              radius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.02),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CSButton(
                  // label: tr('asset:trans_lbl_txid_copy', namedArgs: {
                  //   'txId': StringUtils.strCut(
                  //     widget.item["address"].toString(),
                  //     startKeep: 22,
                  //     endKeep: 10,
                  //   ),
                  // }),
                  label: StringUtils.strCut(
                    'addr:${widget.item['address']}',
                    startKeep: 18,
                    endKeep: 18,
                  ),
                  flat: true,
                  onPressed: () {
                    copyTextToClipboard(widget.item['address'].toString());
                    Toast.show(tr('global:msg_copy_success'));
                  },
                  textStyle: context.textSmall(
                    color: context.bodyColor,
                    bold: true,
                    fontWeight: FontWeight.normal,
                  ),
                  cmpRight: CSButtonIcon(
                    borderRadius: 4,
                    icon: CSIcons.Copy,
                    padding: EdgeInsets.zero,
                    containerSize: 16,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    disabled: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
