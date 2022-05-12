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

  static String helpContactUrl(String lang) {
    String helpWebsiteUrl =
        'http://124.221.253.93:7711/vote.html?language=' + lang;
    return helpWebsiteUrl;
  }

  static const appTwitter = '';
  static const appFacebook = '';
  static const appInstagram = '';
  static const appReddit = '';
  static const appTelegram = '';
}
