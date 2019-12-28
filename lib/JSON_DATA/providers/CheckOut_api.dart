import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';
import 'package:http/http.dart' show Client;



class CheckoutApi {
  Client client = Client();

 Future postCheckoutData(phone,dyningnumber,dyningplace) async {
    var response = await Dio().post(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/checkout5?phone=$phone&mode=$dyningnumber&pm=$dyningplace",
        data:{
        'phone': phone,
        'mode': dyningnumber,
        'pm':dyningplace
      });

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(
        dyningnumber,
      );
      print(dyningplace);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
}

//