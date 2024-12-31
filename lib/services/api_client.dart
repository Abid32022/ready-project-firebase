import 'package:dio/dio.dart';
import 'package:my_qurbani/utils/network_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_constant.dart';
import '../config/app_urls.dart';

class APIClient {
  late final prefs = SharedPreferences.getInstance();
  Dio _dio = Dio();
  Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${AppConstants.getToken}'
  };

  APIClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(seconds: 40),
      connectTimeout: const Duration(seconds: 40),
      baseUrl: AppUrls.baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  Future<Response> get({
    required String url,
  }) async {
    Response response;
    try {
      response = await _dio.get(url,
          options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }

  Future<Response> post({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }

  Future<Response> delete({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.delete(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }

  Future<Response> put({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.put(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioException catch (exception) {
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }
}