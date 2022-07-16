part of asset_ui_module;

class AssetWalletCard extends HookWidget {
  const AssetWalletCard({
    required this.wallet,
    required this.walletStatus,
    required this.fiatCurrency,
    required this.onSync,
    required this.onPressed,
  }) : assert(wallet != null);

  final Wallet wallet;
  final WalletStatus? walletStatus;
  final String fiatCurrency;
  final void Function(Wallet) onSync;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final backLastTime = useState(0);

    useEffect(
      () {
        // When change language, force refresh
        backLastTime.value = backLastTime.value - 1;
        return null;
      },
      [context.locale.languageCode],
    );

    return CSContainer(
      margin: EdgeInsets.zero,
      padding: context.edgeVertical5,
      decoration: AssetBackgroundCircle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CSContainer(
                  margin: context.edgeAll8,
                  padding: context.edgeAll8,
                  //width: null,
                  onTap: onPressed,
                  child: Column(
                    key: Key(wallet.id),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            wallet.name,
                            style: context.textBody(
                              bold: true,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 4),
                          CSButtonIcon(
                            padding: EdgeInsets.only(
                              right: 1,
                              top: 1,
                            ),
                            containerSize: 14,
                            size: 6,
                            borderRadius: 14,
                            icon: CSIcons.ArrowDown,
                            disabled: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        tr('asset:lbl_mnt_address', namedArgs: {
                          'address': wallet.mntAddress,
                        }),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: context.textSmall(
                          bold: true,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CSButtonIcon(
                padding: context.edgeAll.copyWith(right: 0),
                background: Colors.transparent,
                icon: CSIcons.Settings,
                size: 22,
                onPressed: () {
                  WalletManagementPage.open();
                },
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: context.edgeHorizontal16,
                child: Text(
                  '${tr('asset:list_lbl_valuation')}(${AppConstants.currencySymbol})',
                  style: context.textBody(
                    bold: true,
                    color: context.bodyColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              AssetWalletStatus(
                status: walletStatus,
                onPressed: () {
                  onSync(wallet);
                },
              ),
            ],
          ),
          Padding(
            padding: context.edgeAll16.copyWith(top: 0),
            child: AssetPriceListener(
              symbol: 'MNT/USDT',
              builder: (context, price, fiatCurrency, _) => PriceText(
                wallet.getTotalValuation(fiatCurrency),
                '',
                TextSize.huge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
