part of app_module;

class AppCoins {
  static final defaultCoins = [
    // App Specific coins
    CoinInfo(
      chain: AppConstants.mnt_chain,
      symbol: 'MNT',
      name: 'MNT',
      fullName: 'Metabasenet',
      iconLocal: 'assets/images/coin_mnt.png',
      isEnabled: true,
      isFixed: true,
      chainPrecision: 18,
      displayPrecision: 6,
      contract: AppConstants.mnt_fork,
    ),
    CoinInfo(
      chain: 'ETH',
      symbol: 'MNT',
      name: 'MNT-BEP20',
      fullName: 'Metabasenet',
      iconLocal: 'assets/images/coin_mnt.png',
      isEnabled: true,
      isFixed: true,
      chainPrecision: 18,
      displayPrecision: 6,
    ),
    CoinInfo(
      chain: 'ETH',
      symbol: 'USDT',
      name: 'USDT-BEP20',
      fullName: 'Tether USD (BEP20)',
      iconLocal: 'assets/images/coin_usdt_bep.png',
      isEnabled: true,
      isFixed: true,
      chainPrecision: 18,
      displayPrecision: 6,
    ),
    CoinInfo(
      chain: 'ETH',
      symbol: 'BNB',
      name: 'BNB',
      fullName: 'Binance Coin',
      iconLocal: 'assets/images/coin_bnb.png',
      isEnabled: true,
      isFixed: true,
      chainPrecision: 18,
      displayPrecision: 6,
    ),
  ];
}
