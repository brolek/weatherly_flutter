import 'package:weatherly_flutter/config.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';

import 'api_client.dart';
import 'api_result.dart';
import 'network_exceptions.dart';

class ApiRepository {
  ApiClient _apiClient;

  ApiRepository() {
    _apiClient = ApiClient(kBaseUrl);
  }

  Future<ApiResult<AllWeather>> fetchAllWeather(
      double lat, double long, String language) async {
    try {
      Map<String, dynamic> queryParams = {
        "lat": lat,
        "lon": long,
        "appid": kWeatherKey,
        "units": "metric",
        "lang": language
      };
      final response =
          await _apiClient.get("onecall", queryParameters: queryParams);
      AllWeather weather = AllWeather.fromJsonMap(response);
      return ApiResult.success(data: weather);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
