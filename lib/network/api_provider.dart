import 'dart:convert';

import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio;

  ApiProvider({required this.dio});

  Future<dynamic> post(Map payload, String url) async {
    try {
      final response = await dio.post(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> delete(Map payload, String url) async {
    try {
      final response = await dio.delete(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> put(Map? payload, String url) async {
    try {
      final response = await dio.put(url,
          data: payload != null ? jsonEncode(payload) : null);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  //use this for a null payload
  Future<dynamic> emptyPut(String url) async {
    try {
      final response = await dio.put(url);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> getWithParams(
      String url, Map<String, dynamic> queryParameters) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> patch(Map? payload, String url) async {
    try {
      final response = await dio.patch(url,
          data: payload != null ? jsonEncode(payload) : null);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
