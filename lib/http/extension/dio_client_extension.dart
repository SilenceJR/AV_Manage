part of http_client;

extension DioClientExt on DioClient {
  Future<HttpResponse<T?>> postAccept<T>(String url,
      {dynamic body,
      bool? encrypt,
      T? Function(dynamic data)? dataDecoder,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    encrypt ??= config.encryptBody;

    Response? response;
    int code = -1;
    String msg = '';
    try {
      response = await post(url,
          body: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }
    } on Exception catch (e) {
      // TODO

    }

    if (null != response) {
      var data = response.data;
      code = response.data['code'];
      msg = response.data['msg'];
      if (null != dataDecoder) {
        HttpResponse.ok(dataDecoder(data['data']), code: code, msg: msg);
      } else {
        HttpResponse.ok(data, code: code, msg: msg);
      }
    }

    return HttpResponse.exception(NetException(code, defaultMsg: msg));
  }
}
