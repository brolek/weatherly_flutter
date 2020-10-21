import 'package:weatherly_flutter/config.dart';
import 'package:weatherly_flutter/service/api_client.dart';

class ApiRepository {
  ApiClient apiClient;

  ApiRepository() {
    apiClient = ApiClient(kBaseUrl);
  }
}