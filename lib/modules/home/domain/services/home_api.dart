part of home_domain_module;

class HomeApi {
  Future<List<dynamic>> getBanners() async {
    final dio = Dio();
    final response = await dio.get('${AppConstants.randomApiUrl}/banners');
    return response.data as List<dynamic>;
  }

  //get Quotations
  Future<List<dynamic>> getQuotations({
    required String marketId,
    required int timestamp,
  }) async {
    final dio = Dio();
    final response = await dio.get('${AppConstants.randomApiUrl}/quotations');
    return response.data as List<dynamic>;
  }
}
