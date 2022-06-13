part of invest_domain_module;

class InvestRepository {
  factory InvestRepository([InvestApi? _api]) {
    _instance._api = _api ?? InvestApi();
    return _instance;
  }
  InvestRepository._internal();

  static final _instance = InvestRepository._internal();

  late InvestApi _api;

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
    return c!;
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

  //
  Future<List<dynamic>> getProfitRecordList({
    required String fork,
    required String address,
    required int skip,
    required int take,
  }) async {
    final dio = Dio();
    final response =
        await dio.get('${AppConstants.randomApiUrl}/profit?address=$address');
    //final data = response.data;

    List<dynamic> d = [];
    Map<String, dynamic> e = {
      'vote': '1',
      'extend': '1',
      'balance': '1',
      'height': '1200',
      'txid': '1',
      'time': '2022-6-10 10:00:00'
    };

    d.add(e);
    return d;

    //return response.data as List<dynamic>;

    // return List<Map<String, dynamic>>.from(
    //   data.map(
    //     (e) => Map<String, dynamic>.from(e as Map<String, dynamic>),
    //   ),
    // );
  }

  //
  Future<List<dynamic>> getProfitInvitationList({
    required String fork,
    required String addr,
    required int skip,
    required int take,
  }) async {
    final dio = Dio();
    final response =
        await dio.get('${AppConstants.randomApiUrl}/general_reward?addr=$addr');
    return response.data as List<dynamic>;

    // List<dynamic> d = [];
    // Map<String, dynamic> e = {
    //   'address': 'x09883fjjjfff',
    //   'amount': '120',
    //   'height': '1200',
    //   'time': '2022-6-10 10:00:00'
    // };

    // d.add(e);
    // return d;
  }
}
