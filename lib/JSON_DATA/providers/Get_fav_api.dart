import 'dart:convert';

import 'package:fatburger/MODEL/get_fav_Model.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:http/http.dart';


class GetFavApi {
  List<GetFavModel> list;

  Client client = Client();
  String favUrl = "http://142.93.219.45:8080/KyanCafe/kyancafe/favourites/50372282";
  Future<List<GetFavModel>> fetchfavList() async {
    try {
      final response = await client.get(favUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("Fav data..");
        print(rest);

        list = rest
            .map<GetFavModel>((json) => GetFavModel.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}