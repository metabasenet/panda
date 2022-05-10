part of community_domain_module;

enum CommunityTypes {
  /// 10 市场 market
  market,

  /// 20 开发 develop
  develop,

  /// 30 媒体 media
  media,

  /// 40 运营 operations
  operations,

  /// 50 资本 capital
  investor,

  /// 60 教育 technical
  education,

  // 70 Mars开发社区
  marsDevelop
}

class CommunityUtils {
  static CommunityTypes mapCommunityType(int apiStatus) {
    switch (apiStatus) {
      case 10:
        return CommunityTypes.market;
      case 20:
        return CommunityTypes.develop;
      case 30:
        return CommunityTypes.media;
      case 40:
        return CommunityTypes.operations;
      case 50:
        return CommunityTypes.investor;
      case 60:
        return CommunityTypes.education;
      case 70:
        return CommunityTypes.marsDevelop;
      default:
        return CommunityTypes.market;
    }
  }

  static String getJoinTransKey(CommunityTypes type) {
    switch (type) {
      case CommunityTypes.market:
        return 'community:join_market';
      case CommunityTypes.media:
        return 'community:join_media';
      case CommunityTypes.operations:
        return 'community:join_operation';
      case CommunityTypes.investor:
        return 'community:join_investor';
      case CommunityTypes.education:
        return 'community:join_education';
      case CommunityTypes.develop:
        return 'community:join_develop';
      case CommunityTypes.marsDevelop:
        return 'community:join_sugar_develop';
      default:
        return '';
    }
  }

  static String getCreateTransKey(CommunityTypes type) {
    switch (type) {
      case CommunityTypes.market:
        return 'community:create_market';
      case CommunityTypes.media:
        return 'community:create_media';
      case CommunityTypes.operations:
        return 'community:create_operation';
      case CommunityTypes.investor:
        return 'community:create_investor';
      case CommunityTypes.education:
        return 'community:create_education';
      case CommunityTypes.develop:
        return 'community:create_develop';
      case CommunityTypes.marsDevelop:
        return 'community:create_sugar_develop';
      default:
        return '';
    }
  }

  static String getEntryTransKey(CommunityTypes type) {
    switch (type) {
      case CommunityTypes.market:
        return 'community:home_menu_create_market';
      case CommunityTypes.develop:
        return 'community:home_menu_create_develop';
      case CommunityTypes.media:
        return 'community:home_menu_create_media';
      case CommunityTypes.investor:
        return 'community:home_menu_create_investor';
      case CommunityTypes.operations:
        return 'community:home_menu_create_operations';
      case CommunityTypes.education:
        return 'community:home_menu_create_education';
      case CommunityTypes.marsDevelop:
        return 'community:home_menu_create_sugar_develop';
      default:
        return 'community:home_menu_unknown';
    }
  }
}
