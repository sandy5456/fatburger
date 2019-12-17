import 'dart:async';
import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';
import 'package:http/http.dart' show Client;



class AddTocartApi {
  Client client = Client();
  final String addToCartUrl =
      "http://142.93.219.45:8080/KyanCafe/kyancafe/addCart";

Future additemToCart(productId, quantity) async {
    final response = await client.post(
      addToCartUrl,
      body: {
        'productCode': productId,
        'quantity': quantity,
       // 'phone': phone,
      },
    );
    if (response.statusCode == 200) {
       print(response.statusCode);
      return response;
     
     
    } else {
      throw (Exception("Failed"));
    }
  }
}