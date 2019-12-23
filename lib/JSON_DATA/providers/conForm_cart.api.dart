import 'dart:convert';


import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:http/http.dart';


class ConFirmCARTApi {
  GetCartModel2 list;

  Client client = Client();
  String getCartUrl = "http://142.93.219.45:8080/KyanCafe/kyancafe/viewCart";
  Future<GetCartModel2> fetchconfinrmCARTList() async {
    try {
      final response = await client.get(getCartUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //final rest = data ;
        print("View cart CONFIRM CART DATA..");
      

        list = GetCartModel2.fromJson(data);
          print(data);
          return list;

        
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}//http://www.mocky.io/v2/5df759f732000054002dfea4