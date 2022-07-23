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
  static const appHelpeUrl =
      'http://124.221.253.93:7711'; //'https://browser.Metabasenet.site/api';

  static String helpContactUrl(String lang) {
    return '$appHelpeUrl/publish.html?language=$lang';
  }

  static String voteUrl(String lang) {
    return '$appHelpeUrl/vote.html?language=$lang';
  }

  static String transactionUrl(String lang) {
    return '$appHelpeUrl/transaction.html?language=$lang';
  }

  static const appTwitter = '';
  static const appFacebook = '';
  static const appInstagram = '';
  static const appReddit = '';
  static const appTelegram = '';
}
