import 'dart:async';
import 'package:fatburger/MODEL/checkOut_model.dart';
import 'package:http/http.dart' show Client;



class CheckoutApi {
  Client client = Client();
  final String checkoutUrl =
      "http://192.168.8.125/homyfi/public/app/property";

  Future postCheckoutData(CheckOutModel cheakOutModel) async {
    try {
      final response =
          await client.post(checkoutUrl, body: cheakOutModel.toMap());
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to add data");
      }
    } catch (e) {}
    print("entered");
  }
}