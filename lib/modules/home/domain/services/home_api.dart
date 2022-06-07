part of home_domain_module;

class HomeApi {
  Future<List<dynamic>> getBanners() async {
    final dio = Dio();
    final response = await dio.get('${AppConstants.randomApiUrl}/banners');
    debugPrint("========================> test ");
    debugPrint(response.toString());
    debugPrint("========================> test");
    final data = response.data;
    return List<Map<String, dynamic>>.from(
      data.map(
        (e) => Map<String, dynamic>.from(e as Map<String, dynamic>),
      ),
    );
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
