import 'dart:async';
import 'package:fatburger/MODEL/Cart_Model.dart';
import 'package:http/http.dart' show Client;

import 'dart:convert';

class FavPostProvider {
  List<CartModel> list;
  CartModel cartModel;
  static double total;
  Client client = Client();
  final String getCartUrl="http://www.mocky.io/v2/5de7a0923700007b02092ac8";

  final String cartUrl = "${"LINK_HEADER"}cart/index/";

  final String itemToFavUrl = "${"LINK_HEADER"}cart/add/";

  final String itemRemoveUrl = "${"LINK_HEADER"}cart/remove/";

  Future<CartModel> fetchCartList(String phoneNumber) async {
 // final response = await client.post(cartUrl, body: {'phone': phoneNumber});
 final response = await client.get(getCartUrl);
    if (response.statusCode == 200) {
      print("CART DATA..");
      try {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print(rest);

        list = rest.map<CartModel>((json) => CartModel.fromJson(json)).toList();

        cartModel = CartModel.fromJson(data);

        return cartModel;
      } catch (Exception) {
        print("EXCEPTION : $Exception ");
      }
    } else {
      throw Exception("Failed to load Products");
    }
  }

  Future addToFav(productId, phone,) async {
    final response = await client.post(
      itemToFavUrl,
      body: {
        'product_id': productId,
        'phone': phone,
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }

  Future removeFromFav(productId, phone) async {
    final response = await client.post(
      itemRemoveUrl,
      body: {'product_id': productId,'phone': phone},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
}
