import 'dart:convert';

import 'package:fatburger/MODEL/Get_Cart_Model.dart';
import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:http/http.dart';


class GettingCARTApi {
  List<GetCartModel> list;

  Client client = Client();
  String getCartUrl = "http://www.mocky.io/v2/5dee1b8c3300004a0098442e";
  Future<List<GetCartModel>> fetchCARTList() async {
    try {
      final response = await client.get(getCartUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("CART DATA..");
        print(rest);

        list = rest
            .map<GetCartModel>((json) => GetCartModel.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}