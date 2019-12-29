import 'dart:async';
import 'package:dio/dio.dart';

import 'package:http/http.dart' show Client;

class FavPostProvider {
  Client client = Client();

  Future addToFav(
    productId,
    phone,
  ) async {
    var response = await Dio().post(
      //"http://142.93.219.45:8080/KyanCafe/kyancafe/favourites/$productId",
      "http://142.93.219.45:8080/KyanCafe/kyancafe/favourites/$productId/user/$phone",
      data: {
        'id': productId,
        'userid': phone,
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }

  Future removeFromFav(productId) async {
    var response = await Dio().post(
      "http://142.93.219.45:8080/KyanCafe/kyancafe/favourites/$productId",
      //  "http://142.93.219.45:8080/KyanCafe/kyancafe/favourites/$productId/user/$phone",
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
}
