import 'dart:async';

import 'package:http/http.dart' show Client;
import 'package:kyankafe/MODEL/Payment_model.dart';



class PaymentApi {
  Client client = Client();
  final String paymenttUrl =
      "http://192.168.8.125/homyfi/public/app/property";

  Future postPaymentData(PaymentModel paymentModel) async {
    try {
      final response =
          await client.post(paymenttUrl, body: paymentModel.toMap());
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to add data");
      }
    } catch (e) {}
    print("entered");
  }
}