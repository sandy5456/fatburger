import 'dart:convert';

import 'package:fatburger/model/foods_response.dart';
import 'package:http/http.dart';


class PropertyProvider {
  List<FoodResponse> list;

  Client client = Client();
  String propertyUrl = "http://www.mocky.io/v2/5de8ab0d3100004c006b12fe";
  Future<List<FoodResponse>> fetchPropertyList() async {
    try {
      final response = await client.get(propertyUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("we r getting data..");
        print(rest);

        list = rest
            .map<FoodResponse>((json) => FoodResponse.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}