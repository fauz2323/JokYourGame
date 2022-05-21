import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  static var baseUrl = 'http://192.168.5.13:8000';
  var token;

  // ignore: constant_identifier_names
  static Uri AUTH = Uri.parse(baseUrl + '/api/auth');
  static Uri GameList = Uri.parse(baseUrl + '/api/game');
  static Uri Product = Uri.parse(baseUrl + '/api/product-list');
  static Uri Topup = Uri.parse(baseUrl + '/api/topup');
  static Uri topupList = Uri.parse(baseUrl + '/api/topup-list');
  static Uri uploadBukti = Uri.parse(baseUrl + '/api/upload-bukti');
  static Uri login = Uri.parse(baseUrl + '/api/login');
  static Uri register = Uri.parse(baseUrl + '/api/register');

  getHeaderPost(var token) {
    Map<String, String> data = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  getHeaderGet(var token) {
    Map<String, String> data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }
}
