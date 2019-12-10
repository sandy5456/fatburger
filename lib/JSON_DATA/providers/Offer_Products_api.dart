import 'dart:convert';

import 'package:fatburger/model/Offer_product_model.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:http/http.dart';


class OfferProductProvider {
  List<OfferProductModel> list;

  Client client = Client();
  String offerProductUrl = "http://www.mocky.io/v2/5de8ce6c3100005f006b1439";
  Future<List<OfferProductModel>> fetchOfferProductList() async {
    try {
      final response = await client.get(offerProductUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("we r getting OFFER data..");
        print(rest);

        list = rest
            .map<OfferProductModel>((json) => OfferProductModel.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}