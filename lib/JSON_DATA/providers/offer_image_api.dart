import 'dart:convert';

import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:http/http.dart';


class OfferImageProvider {
  List<OfferImageModel> list;

  Client client = Client();
  String propertyUrl = "http://www.mocky.io/v2/5df1f4d43100007b009a2e4c";
  Future<List<OfferImageModel>> fetchImageList() async {
    try {
      final response = await client.get(propertyUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("images data..");
        print(rest);

        list = rest
            .map<OfferImageModel>((json) => OfferImageModel.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}