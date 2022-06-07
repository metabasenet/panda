part of explorer_domain_module;

class ExplorerUtils {
  static const onlySearchAddress = [
    AppConstants.mnt_chain,
    'BNB',
  ];

  static const explorerChains = [
    AppConstants.mnt_chain,
    'BNB',
  ];

  static const browserUrl = 'https://testnet.bscscan.com';
  static final explorerConfigs = [
    ExplorerConfig(
      chain: AppConstants.mnt_chain,
      name: 'Metabasenet',
      mainUrl: browserUrl,
      txUrl: 'http://124.221.253.93/tx?txid=',
      addressUrl: 'http://124.221.253.93/address?hash=',
    ),
    ExplorerConfig(
      chain: 'BNB',
      name: 'Binance Coin',
      mainUrl: browserUrl,
      txUrl: 'https://testnet.bscscan.com/tx/',
      addressUrl: 'https://testnet.bscscan.com/address/',
    ),
  ];

  static String getChainExplorerTxUrl(String chain, String txid) {
    final list = explorerConfigs.firstWhere((item) => item.chain == chain);

    if (onlySearchAddress.contains(chain)) {
      return list != null ? (list.txUrl + txid) : browserUrl;
    }

    return browserUrl;
  }

  static String getChainExplorerSearchUrl(String chain, String term) {
    final list = explorerConfigs.firstWhere((item) => item.chain == chain);

    if (onlySearchAddress.contains(chain)) {
      return list != null ? (list.addressUrl + term) : browserUrl;
    }

    return browserUrl;
  }
}
