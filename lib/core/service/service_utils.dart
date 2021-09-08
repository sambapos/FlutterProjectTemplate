import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../core_shelf.dart';

class ServiceUtils {
  static final ServiceUtils _instance = ServiceUtils._init();
  static ServiceUtils get instance => _instance;

  ServiceUtils._init();

  static const String baseText = 'http://localhost:3000/api';

  Future<void> setToken(String token) async {
    await LocalManager.instance
        .setStringValue(LocalManagerKeys.accessToken, token);
    final expireInString =
        DateTime.now().add(const Duration(minutes: 59)).toIso8601String();
    await LocalManager.instance
        .setStringValue(LocalManagerKeys.accessTokenExpireTime, expireInString);
  }

  Future<String> getToken() async {
    final accessToken = await LocalManager.instance
        .getStringValue(LocalManagerKeys.accessToken);
    return accessToken;
  }

  String checkError(DioError e) {
    if (e.response != null && e.response!.statusCode == 401) {
      return 'Login';
    }
    if (DioErrorType.receiveTimeout == e.type ||
        DioErrorType.connectTimeout == e.type) {
      return 'internet_connection'.translate;
    } else if (DioErrorType.response == e.type) {
      if (e.response.toString().contains('html')) {
        return 'temporary_problem'.translate;
      } else {
        if (jsonDecode(e.response.toString()) != null) {
          return jsonDecode(e.response.toString())['resultMessage'];
        } else {
          return 'Error Occurred';
        }
      }
    } else {
      return 'internet_connection'.translate;
    }
  }

  Future<bool> isValidToken() async {
    var expireTimeInString = await LocalManager.instance
        .getStringValue(LocalManagerKeys.accessTokenExpireTime);
    if (expireTimeInString == '') return false;

    var expireTime = DateTime.parse(jsonDecode(expireTimeInString));
    if (DateTime.now().difference(expireTime).inMinutes > 59) return false;
    return true;
  }

  Future<bool> requestBeforeCheck() async {
    if (await isValidToken()) {
      return true;
    } else {
      await NavigationService.instance
          .navigateToPage(path: NavigationConstants.login);
      return false;
    }
  }

  Future<void> requestHelper(
      Future<void> Function() function, BuildContext context) async {
    DialogBuilder(context).showLoadingIndicator();
    await function();
    Navigator.of(context).pop();
  }
}
