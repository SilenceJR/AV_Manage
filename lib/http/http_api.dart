import 'package:av_manage/http/http_mixin.dart';

class HttpApi with DioClientMixin {
  HttpApi._();

  static HttpApi instance = HttpApi._();

  a() {
    httpClient.postAccept('url', dataDecoder: (res) {});
  }
}
