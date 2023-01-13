import '../net_code.dart';
import '../net_exception.dart';

class HttpResponse<T> {
  int _code = 0;

  int get code => _code;

  T? _data;

  T? get data => _data;

  String _msg = '';

  String get msg => _msg;

  bool get ok => _code == NetCode.ok;

  HttpResponse.ok(T? data, {int? code, msg = ''}) {
    _data = data;
    _code = code ?? NetCode.ok;
    _msg = msg;
  }

  HttpResponse.exception(NetException e) {
    _code = e.code;
    _msg = e.message;
  }

  Map<String, dynamic> toJson() => {'code': code, 'data': data, 'msg': msg};
}
