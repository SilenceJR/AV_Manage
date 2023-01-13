import 'package:encrypt/encrypt.dart';

class HttpEncrypt {
  final Key key;

  static HttpEncrypt? _instance;

  factory HttpEncrypt.getInstance(Key key) => _getInstance(key);

  static _getInstance(Key key) {
    _instance ??= HttpEncrypt._internal(key);
    return _instance;
  }

  late Encrypter _encrypter;
  late IV _iv;

  HttpEncrypt._internal(this.key) {
    _encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
    ));
    _iv = IV.fromLength(16);
  }

  String encrypt(String content) {
    return _encrypter.encrypt(content, iv: _iv).base64;
  }

  String decrypt(String content) {
    return _encrypter.decrypt64(content, iv: _iv);
  }

  static Key randomKey(int length) => Key.fromSecureRandom(length);
  static IV randomIv(int length) => IV.fromSecureRandom(length);
}
