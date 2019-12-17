import 'dart:convert';


import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:http/http.dart';


class GettingCARTApi {
  List<GetCartModel2> list;

  Client client = Client();
  String getCartUrl = "http://www.mocky.io/v2/5df759f732000054002dfea4";
  Future<List<GetCartModel2>> fetchCARTList() async {
    try {
      final response = await client.get(getCartUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("CART DATA..");
        print(rest);

        list = rest
            .map<GetCartModel2>((json) => GetCartModel2.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}