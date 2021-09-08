import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  late Dio _service;
  final String contentType = 'application/json';
  static NetworkManager get instance => _instance;

  NetworkManager._init() {
    _service = Dio();
  }

  Future<Map<String, dynamic>> postRequest({
    required String url,
    required Map<String, dynamic> json,
    String? token = '',
  }) async {
    try {
      final res = await _service.post(
        url,
        data: json.toString(),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: contentType,
          'Authorization': token
        }),
      );
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getRequest({
    required String url,
    String token = '',
  }) async {
    try {
      final res = await _service.get(
        url,
        options: Options(headers: {'Authorization': token}),
      );
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> putRequest({
    required String url,
    required Map<String, dynamic> json,
    String token = '',
  }) async {
    try {
      final res = await _service.put(
        url,
        data: json.toString(),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: contentType,
          'Authorization': token
        }),
      );
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteRequest({
    required String url,
    required Map<String, dynamic> json,
    String token = '',
  }) async {
    try {
      final res = await _service.delete(
        url,
        data: json.toString(),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: contentType,
          'Authorization': token
        }),
      );
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }
}
