import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioUtil {
  late final Dio dio;

  DioUtil() {
    dio = Dio(BaseOptions());
    dio.interceptors.add(LogInterceptor());
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (url) {
        return "PROXY 127.0.0.1:7890";
      };
    };
  }
}
