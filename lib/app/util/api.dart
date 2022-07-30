import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  static var baseUrl = 'http://10.0.2.2:8000';
  static var imageUrl = 'http://10.0.2.2:8000';
  var token;

  // ignore: constant_identifier_names
  static Uri AUTH = Uri.parse(baseUrl + '/api/auth');
  static Uri GameList = Uri.parse(baseUrl + '/api/game');
  static Uri Product = Uri.parse(baseUrl + '/api/product-list');
  static Uri Topup = Uri.parse(baseUrl + '/api/topup');
  static Uri topupList = Uri.parse(baseUrl + '/api/topup-list');
  static String uploadBukti = baseUrl + '/api/upload-bukti';
  static Uri login = Uri.parse(baseUrl + '/api/login');
  static Uri detailProduct = Uri.parse(baseUrl + '/api/detail-product');
  static Uri register = Uri.parse(baseUrl + '/api/register');
  static Uri allPending = Uri.parse(baseUrl + '/api/topup-allPending');
  static Uri portofolio = Uri.parse(baseUrl + '/api/detail-product-porto');
  static Uri imageProduct = Uri.parse(baseUrl + '/api/detail-product-getImage');
  static Uri makeOrder = Uri.parse(baseUrl + '/api/make-order');
  static Uri orderList = Uri.parse(baseUrl + '/api/list-order');
  static Uri sendMessage = Uri.parse(baseUrl + '/api/send-message');
  static Uri getMessage = Uri.parse(baseUrl + '/api/get-message');
  static Uri getRecipe = Uri.parse(baseUrl + '/api/detail-order');
  static Uri sendReview = Uri.parse(baseUrl + '/api/product-review');
  static Uri reviewList = Uri.parse(baseUrl + '/api/get-review');
  static Uri getDataUser = Uri.parse(baseUrl + '/api/getDataUser');
  static Uri changePass = Uri.parse(baseUrl + '/api/changePass');

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
