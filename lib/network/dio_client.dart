import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_senior_mobile_app/constants/Url.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioClient {

  DioClient();
  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: Urls.baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    Dio refreshDio = Dio(options);

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }
}
