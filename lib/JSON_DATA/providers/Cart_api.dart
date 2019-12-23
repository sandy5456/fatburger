import 'dart:async';
import 'package:fatburger/MODEL/Cart_Model.dart';
import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/MODEL/New_model_Get_cart.dart';
import 'package:http/http.dart' show Client;

import 'dart:convert';

class CartApiProvider {
  List<GetCartModel2> list;
  GetCartModel2 cartModel;
  static double total;
  Client client = Client();
  final String getCartUrl="http://www.mocky.io/v2/5de7a0923700007b02092ac8";

  final String cartUrl = "${"LINK_HEADER"}cart/index/";

  final String itemToCartUrl = "http://142.93.219.45:8080/KyanCafe/kyancafe/addCart";

  final String itemRemoveUrl = "${"LINK_HEADER"}cart/remove/";

  Future<GetCartModel2> fetchCartList(String phoneNumber) async {
 // final response = await client.post(cartUrl, body: {'phone': phoneNumber});
 final response = await client.get(getCartUrl);
    if (response.statusCode == 200) {
      print("CART DATA.....");
      try {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print(rest);

        list = rest.map<GetCartModel2>((json) => GetCartModel2.fromJson(json)).toList();

        cartModel = GetCartModel2.fromJson(data);

        return cartModel;
      } catch (Exception) {
        print("EXCEPTION : $Exception ");
      }
    } else {
      throw Exception("Failed to load Products");
    }
  }

  Future addToCart(productId, phone, quantity) async {
    final response = await client.post(
      itemToCartUrl,
      body: {
        'productCode': productId,
        'quantity': quantity,
       // 'phone': phone,
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }

  Future removeFromCart(productId, phone) async {
    final response = await client.post(
      itemRemoveUrl,
      body: {'product_id': productId, 'quantity': "1", 'phone': phone},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
}
