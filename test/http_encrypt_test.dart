import 'package:av_manage/http/enctypt/http_encrypt.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var randomKey = HttpEncrypt.randomKey(16);
  var httpEncrypt = HttpEncrypt.getInstance(randomKey);
  const content = 'test data';

  test('encrypt', () {
    var encrypt = httpEncrypt.encrypt(content);

    var decrypt = httpEncrypt.decrypt(encrypt);

    print('decrypt>>>$decrypt');
  });
}
