import 'package:dio/dio.dart';
import 'package:flutter_senior_mobile_app/constants/Url.dart';
import 'package:flutter_senior_mobile_app/network/dio_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([])
void main() {
  late DioClient dioClient;

  setUp(() {
    dioClient = DioClient();
  });

  test('get dio returns an instance of dio', () {
    expect(dioClient.dio, isA<Dio>());
  });

  test('dio returns the correct base url', () {
    expect(dioClient.dio.options.baseUrl, Urls.baseUrl);
  });

  test('dio returns the correct receiveTimeout and connectTimeout', () {
    expect(dioClient.dio.options.connectTimeout, 50000);
    expect(dioClient.dio.options.receiveTimeout, 30000);
  });

  test('dio returns the correct number of interceptors', () {
    expect(dioClient.dio.interceptors.length, 3);
  });
}
