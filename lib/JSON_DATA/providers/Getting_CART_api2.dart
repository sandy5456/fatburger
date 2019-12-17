// import 'dart:convert';

// import 'package:fatburger/MODEL/Get_Cart_Model.dart';
// import 'package:fatburger/model/OfferImage.dart';
// import 'package:fatburger/model/foods_response.dart';
// import 'package:http/http.dart';

// class GettingCARTApi {
//   List<GetCartModel> list;

//   Client client = Client();
//   String getCartUrl = "http://www.mocky.io/v2/5df1f37d31000074009a2e41";
//   Future<List<GetCartModel>> fetchCARTList() async {
//     try {
//       final response =
//           await client.get("http://www.mocky.io/v2/5df759f732000054002dfea4");

// //      print(response);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final rest = data as List;
// //        print("CART DATA.." + response.body);
//         print(rest);

//         var cart = GetCartModel.fromJson(rest[0]);

//         print("AR" + cart.toString());
// //        list = rest
// //            .map<GetCartModel>((json) => GetCartModel.fromJson(json))
// //            .toList();

// //        print(" LSIT" + list.toString());
//         list.add(cart);
//         return list;
//       } else {
//         throw Exception("Failed to load Deals");
//       }
//     } catch (e) {}
//   }
// }
