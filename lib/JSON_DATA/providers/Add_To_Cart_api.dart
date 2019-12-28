import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';
import 'package:http/http.dart' show Client;

class AddTocartApi {
  Client client = Client();

  Future addToCart(productId, quantity) async {Map map = new Map();
  map = {
    "cookie" :"sessions_data"
  };
    var response = await Dio().post(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/addCart?productId=$productId&quantity=$quantity",
        data:{
        'productCode': productId,
        'quantity': quantity,
      },options: Options(
        headers: {"Cookie": map},
      ));

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
  
  Future removeToCart(productId, quantity) async {
    var response = await Dio().post(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/addCart?productId=$productId&quantity=$quantity",
        data:{
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
}
