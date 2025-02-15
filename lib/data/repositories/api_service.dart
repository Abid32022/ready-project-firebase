import 'package:dio/dio.dart';
import '../../config/app_urls.dart';
import '../../services/api_client.dart';

class ApiService {
  final APIClient apiClient = APIClient();

  Future<Response> getDatingRepo({required int page, required int result}) {
    final url = '${AppUrls.baseUrl}${AppUrls.datList}?page=$page&results=$result';
    return apiClient.get(url: url);
  }
}
