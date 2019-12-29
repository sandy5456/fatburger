import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:http/http.dart' show Client;

import 'package:requests/requests.dart';

class AddTocartApi {
  Client client = Client();
  static Map<String, String> headers = {};

  Future addToCart(productId, quantity) async {
    var response = await Requests.post(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/addCart?productId=$productId&quantity=$quantity",
        body: {
          'productCode': productId,
          'quantity': quantity,
        });

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(
        productId,
      );
      print(quantity);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
  Future updateToCart(productId, quantity) async {
    var response = await Requests.put(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/updateCart?productId=$productId&quantity=$quantity",
        body: {
          'productCode': productId,
          'quantity': quantity,
        });

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(
        productId,
      );
      print(quantity);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
  Future removeToCart(productId) async {
    var response = await Requests.get(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/deleteCart?code=$productId",
        );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(
        productId,
      );
     
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
}
