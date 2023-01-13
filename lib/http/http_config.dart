import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'enctypt/http_encrypt.dart';

typedef HttpClientEncryptor = String Function(dynamic body);
typedef HttpClientDecryptor = String Function(dynamic body);

class HttpClientConfig {
  final String httpBaseUrl;
  final String? proxy;
  final bool debugEnable;
  final List<Interceptor> httpInterceptors;

  ///是否对网络请求参数加密
  final bool encryptBody;
  final HttpEncrypt? httpEncrypt;
  final HttpClientEncryptor? encryptor;
  final HttpClientDecryptor? decryptor;

  HttpClientConfig.init(
      {required this.httpBaseUrl,
      required this.httpInterceptors,
      this.proxy,
      this.debugEnable = !kReleaseMode,
      this.encryptBody = false,
      this.httpEncrypt,
      this.encryptor,
      this.decryptor})
      : assert(encryptBody
            ? null != httpEncrypt || (null != encryptor && null != decryptor)
            : false);
}
