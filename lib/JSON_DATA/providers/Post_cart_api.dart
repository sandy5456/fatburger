import 'dart:async';

import 'package:http/http.dart' show Client;
import 'package:kyankafe/MODEL/Post_cart_model.dart';



class PostCartApi {
  Client client = Client();
  final String checkoutUrl =
      " http://142.93.219.45:8080/KyanCafe/kyancafe/addCart";

  Future postcartData(PostCartModel postCartModel) async {
    try {
      final response =
          await client.post(checkoutUrl, body: postCartModel.toMap());
      if (response.statusCode == 200) {
        print(response.statusCode);
        return response;
      } else {
        throw Exception("Failed to add data");
      }
    } catch (e) {}
    print("entered");
  }
}