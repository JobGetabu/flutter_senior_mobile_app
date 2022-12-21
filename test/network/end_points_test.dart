import 'package:flutter_senior_mobile_app/constants/Url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('login url is correct', () {
    String _url = '${Urls.baseUrl}/signin';

    expect('${Urls.baseUrl}/signin', _url);
  });
}
