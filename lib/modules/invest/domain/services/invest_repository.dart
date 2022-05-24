part of invest_domain_module;

class InvestRepository {
  factory InvestRepository([InvestApi _api]) {
    _instance._api = _api ?? InvestApi();
    return _instance;
  }
  InvestRepository._internal();

  static final _instance = InvestRepository._internal();

  InvestApi _api;

  Future<InvestConfig> getConfig() async {
    final json = [
      {
        'id': 1,
        'name': {'MNT': 'Metabasenet'},
        'symbol': AppConstants.mnt_chain,
        'chain': AppConstants.mnt_chain,
        'mint_enable': 11,
        'min_balance': 100
      }
    ];
    final c = InvestConfig.fromJson(json);
    return c;
  }

  /*
  Future<Map<String, dynamic>> getMintInfo({
    @required String fork,
    @required String addr,
  }) async {
    final dio = Dio();
    final response =
        await dio.get('${AppConstants.randomApiUrl}/mint?addr=$addr');
    final data = response.data;
    return data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getChartList({
    @required String fork,
    @required String addr,
  }) async {
    final dio = Dio();
    final response =
        await dio.get('${AppConstants.randomApiUrl}/chart?addr=$addr');
    return response.data as List<dynamic>;
  }
  */

  //get Profit record
  Future<List<dynamic>> getProfitRecordList({
    @required String fork,
    @required String address,
    @required int skip,
    @required int take,
  }) async {
    final dio = Dio();
    final response = await dio.get(
        '${AppConstants.randomApiUrl}/profit?address=$address&pagenum=${(skip + 1)}&pagesize=$take');
    final data = response.data as Map<String, dynamic>;
    return data['data'] as List<dynamic>;
  }

  //get Invitation record
  Future<List<dynamic>> getProfitInvitationList({
    @required String fork,
    @required String addr,
    @required int skip,
    @required int take,
  }) async {
    final dio = Dio();
    final response =
        await dio.get('${AppConstants.randomApiUrl}/general_reward?addr=$addr');
    return response.data as List<dynamic>;
  }
}
