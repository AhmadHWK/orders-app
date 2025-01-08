import 'package:programming_languages_project/core/api/interceptor.dart';

import '/core/api/endpoints.dart';
import '/core/errors/handle_exceptions.dart';
import 'package:dio/dio.dart';

class DioClients {
  final Dio dio;
  DioClients({required this.dio}) {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      error: true,
      requestBody: true,
      responseBody: true,
    ));
  }
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      DioExceptionHandler.handleDioException(e);
    }
  }

  Future<dynamic> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      DioExceptionHandler.handleDioException(e);
    }
  }

  Future<dynamic> put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.put(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      DioExceptionHandler.handleDioException(e);
    }
  }

  Future<dynamic> delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      DioExceptionHandler.handleDioException(e);
    }
  }
}
