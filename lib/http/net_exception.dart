
class NetException implements Exception {
  int code;
  String defaultMsg;

  NetException(this.code, {this.defaultMsg = ''});

  String get message => defaultMsg;
}
