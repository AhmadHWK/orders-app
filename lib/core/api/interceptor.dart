import '/core/cache/cache_memory.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        CacheMemory.instance.getData(key: 'token') != null
            ? 'bearer ${CacheMemory.instance.getData(key: 'token')}'
            : null;

    super.onRequest(options, handler);
  }
}
