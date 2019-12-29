import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';
import 'package:requests/requests.dart';


class ConFirmCARTApi {
  GetCartModel2 list;
  Map<String, String> headers = {};

  http.Client client = http.Client();
  String getCartUrl = "http://142.93.219.45:8080/KyanCafe/kyancafe/viewCart";

  Future<GetCartModel2> fetchconfinrmCARTList() async {
    try {
      dynamic response = await Requests.get(getCartUrl, persistCookies: true);

      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.content());
        print("ConFormCart data ");

        list = GetCartModel2.fromJson(data);
        print(data);
        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}//http://www.mocky.io/v2/5df759f732000054002dfea4 