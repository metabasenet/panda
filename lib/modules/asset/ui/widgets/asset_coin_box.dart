part of asset_ui_module;

class AssetCoinBox extends StatelessWidget {
  const AssetCoinBox({
    required this.title,
    required this.coinInfo,
    this.titleAction,
    this.onPress,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget? titleAction;
  final AssetCoin coinInfo;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return FormBox(
      type: FormBoxType.child,
      title: title,
      titleAction: titleAction,
      child: CSContainer(
        margin: EdgeInsets.zero,
        padding: context.edgeAll.copyWith(top: 18, bottom: 18),
        onTap: onPress,
        child: Row(
          key: ValueKey('$onPress'),
          children: [
            CSImage(
              coinInfo.iconLocal ?? '',
              fallbackUrl: coinInfo.iconLocal,
              width: 30,
              height: 30,
              radius: 30,
              fit: BoxFit.contain,
              bordered: true,
            ),
            SizedBox(width: 10),
            Text(
              coinInfo.name ?? '',
              style: context.textBody(
                bold: true,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(width: 10),
            if (coinInfo.fullName != null)
              Text(
                coinInfo.fullName ?? '',
                style: context.textSecondary(
                  bold: true,
                  fontWeight: FontWeight.normal,
                ),
              ),
            Spacer(),
            if (onPress != null)
              Padding(
                padding: context.edgeLeft8,
                child: Icon(
                  CSIcons.More,
                  size: 12,
                  color: context.bodyColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
