part of app_module;

class AppLinks {
  static const appSupportUrlEn = '';
  static const appSupportUrlZh = '';

  static String appSupportUrl(String lang) =>
      lang == 'zh' ? appSupportUrlZh : appSupportUrlEn;

  static const appContactUrlZh = '';
  static const appContactUrlEn = '';

  static String appContactUrl(String lang) =>
      lang == 'zh' ? appContactUrlZh : appContactUrlEn;

  static const appWebsiteUrl = 'https://metabasenet.club/';

  static const appHelpeUrl = 'https://browser.metabasenet.site/api';
  // static const appHelpeUrl =
  //     'http://124.221.253.93:7711';

  static String helpContactUrl(String lang) {
    return '$appHelpeUrl/publish.html?language=$lang';
  }

  static String voteUrl(String lang) {
    return '$appHelpeUrl/vote.html?language=$lang';
  }

  static String transactionUrl(String lang) {
    return '$appHelpeUrl/transaction.html?language=$lang';
  }

  static String editionUrl(String lang) {
return 'https://browser.metabasenet.site/api/download.html?language=$lang&fruits=zk4z6m2e5p';
  }

  static const appTwitter = '';
  static const appFacebook = '';
  static const appInstagram = '';
  static const appReddit = '';
  static const appTelegram = '';
}
