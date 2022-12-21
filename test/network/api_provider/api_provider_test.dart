import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter_senior_mobile_app/network/api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_provider_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late ApiProvider apiProvider;
  late MockDio mockDio;

  String url = 'https://authtest.sendyit.com/fulfilment/v1/';

  setUp(() async {
    mockDio = MockDio();

    apiProvider = ApiProvider(dio: mockDio);
  });

  group('post ', () {
    test('returns a dynamic when successful', () async {
      when(mockDio.post(
        url,
        data: anyNamed('data'),
      )).thenAnswer((realInvocation) => Future.value(
          Response(data: {}, requestOptions: RequestOptions(path: url))));

      Map<dynamic, dynamic> payload = {};
      var _response = await apiProvider.post(payload, url);

      expect({}, _response);
      verify(
        mockDio.post(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });

    test('throws an error when not successful', () async {
      when(mockDio.post(
        url,
        data: anyNamed('data'),
      )).thenThrow(
        DioError(
          error: 'Something went wrong',
          requestOptions: RequestOptions(path: url),
        ),
      );

      Map<dynamic, dynamic> payload = {};
      expect(() => apiProvider.post(payload, url),
          throwsA('Something went wrong'));
      verify(
        mockDio.post(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });
  });

  group('delete ', () {
    test('returns a dynamic when successful', () async {
      when(mockDio.delete(
        url,
        data: anyNamed('data'),
      )).thenAnswer((realInvocation) => Future.value(
          Response(data: {}, requestOptions: RequestOptions(path: url))));

      Map<dynamic, dynamic> payload = {};
      var _response = await apiProvider.delete(payload, url);

      expect({}, _response);
      verify(
        mockDio.delete(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });

    test('throws an error when not successful', () async {
      when(mockDio.delete(
        url,
        data: anyNamed('data'),
      )).thenThrow(
        DioError(
          error: 'Something went wrong',
          requestOptions: RequestOptions(path: url),
        ),
      );

      Map<dynamic, dynamic> payload = {};
      expect(() => apiProvider.delete(payload, url),
          throwsA('Something went wrong'));
      verify(
        mockDio.delete(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });
  });

  group('put ', () {
    test('returns a dynamic when successful', () async {
      when(mockDio.put(
        url,
        data: anyNamed('data'),
      )).thenAnswer((realInvocation) => Future.value(
          Response(data: {}, requestOptions: RequestOptions(path: url))));

      Map<dynamic, dynamic> payload = {};
      var _response = await apiProvider.put(payload, url);

      expect({}, _response);
      verify(
        mockDio.put(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });

    test('throws an error when not successful', () async {
      when(mockDio.put(
        url,
        data: anyNamed('data'),
      )).thenThrow(
        DioError(
          error: 'Something went wrong',
          requestOptions: RequestOptions(path: url),
        ),
      );

      Map<dynamic, dynamic> payload = {};
      expect(
          () => apiProvider.put(payload, url), throwsA('Something went wrong'));
      verify(
        mockDio.put(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });
  });

  group('emptyPut ', () {
    test('returns a dynamic when successful', () async {
      when(mockDio.put(url)).thenAnswer((realInvocation) => Future.value(
          Response(data: {}, requestOptions: RequestOptions(path: url))));

      var _response = await apiProvider.emptyPut(url);

      expect({}, _response);
      verify(
        mockDio.put(
          url,
        ),
      ).called(1);
    });

    test('throws an error when not successful', () async {
      when(mockDio.put(
        url,
      )).thenThrow(
        DioError(
          error: 'Something went wrong',
          requestOptions: RequestOptions(path: url),
        ),
      );

      expect(() => apiProvider.emptyPut(url), throwsA('Something went wrong'));
      verify(
        mockDio.put(
          url,
        ),
      ).called(1);
    });
  });

  group('get ', () {
    test('returns a dynamic when successful', () async {
      when(mockDio.get(url)).thenAnswer((realInvocation) => Future.value(
          Response(data: {}, requestOptions: RequestOptions(path: url))));

      var _response = await apiProvider.get(url);

      expect({}, _response);
      verify(
        mockDio.get(
          url,
        ),
      ).called(1);
    });

    test('throws an error when not successful', () async {
      when(mockDio.get(
        url,
      )).thenThrow(
        DioError(
          error: 'Something went wrong',
          requestOptions: RequestOptions(path: url),
        ),
      );

      expect(() => apiProvider.get(url), throwsA('Something went wrong'));
      verify(
        mockDio.get(
          url,
        ),
      ).called(1);
    });
  });

  group('getWithParams ', () {
    test('returns a dynamic when successful', () async {
      when(mockDio.get(url, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((realInvocation) => Future.value(
              Response(data: {}, requestOptions: RequestOptions(path: url))));

      var _response = await apiProvider.getWithParams(url, {});

      expect({}, _response);
      verify(
        mockDio.get(url, queryParameters: anyNamed('queryParameters')),
      ).called(1);
    });

    test('throws an error when not successful', () async {
      when(mockDio.get(
        url,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(
        DioError(
          error: 'Something went wrong',
          requestOptions: RequestOptions(path: url),
        ),
      );

      expect(() => apiProvider.getWithParams(url, {}),
          throwsA('Something went wrong'));
      verify(
        mockDio.get(url, queryParameters: anyNamed('queryParameters')),
      ).called(1);
    });
  });

  group('patch ', () {
    test('returns a dynamic when successful', () async {
      when(mockDio.patch(
        url,
        data: anyNamed('data'),
      )).thenAnswer((realInvocation) => Future.value(
          Response(data: {}, requestOptions: RequestOptions(path: url))));

      Map<dynamic, dynamic> payload = {};
      var _response = await apiProvider.patch(payload, url);

      expect({}, _response);
      verify(
        mockDio.patch(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });

    test('throws an error when not successful', () async {
      when(mockDio.patch(
        url,
        data: anyNamed('data'),
      )).thenThrow(
        DioError(
          error: 'Something went wrong',
          requestOptions: RequestOptions(path: url),
        ),
      );

      Map<dynamic, dynamic> payload = {};
      expect(() => apiProvider.patch(payload, url),
          throwsA('Something went wrong'));
      verify(
        mockDio.patch(
          url,
          data: anyNamed('data'),
        ),
      ).called(1);
    });
  });
}
