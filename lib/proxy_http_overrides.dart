import 'dart:io';

class ProxyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..findProxy = _findProxy;
  }

  String _findProxy(Uri url) {
    return HttpClient.findProxyFromEnvironment(url, environment: {
      'http_proxy': '127.0.0.1:7890',
      'https_proxy': '127.0.0.1:7890',
      // 'no_proxy':...,
    });
  }
}
