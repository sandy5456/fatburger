// import 'package:dio/dio.dart';
// import 'package:kyankafe/MODEL/foods_response.dart';
// import 'package:kyankafe/MODEL/order_response.dart';
// import 'package:kyankafe/MODEL/user_response.dart';


// class ApiProvider {
//   Future<FoodResponse> fetchAllFoods() async {
//     var dio = Dio()..options.connectTimeout = 10000;
//     Response response;
//     try {
//       response = await dio.get('http://www.mocky.io/v2/5de660803700005f000922d6');
//       if (response.data['status'] == 1) {
//         print("data is coming");
//         return FoodResponse.fromJson(response.data);
//       } else {
//         throw response.data['message'];
//       }
//     } on DioError catch (error) {
//       handleExceptionError(error);
//       return null;
//     }
//   }

//   Future<UserResponse> fetchUserData() async {
//     try {
//       var response = await Dio().get('$BASE_URL/api/user/info/$userId');
//       if (response.data['status'] == 1) {
//         return UserResponse.fromJson(response.data);
//       } else {
//         throw response.data['message'];
//       }
//     } on DioError catch (error) {
//       handleExceptionError(error);
//       return null;
//     }
//   }

//   Future<OrderResponse> fetchUserOrderHistory() async {
//     try {
//       var response = await Dio().get('$BASE_URL/api/order/user', queryParameters: {"token": token});
//       if (response.data['status'] == 1) {
//         return OrderResponse.fromJson(response.data);
//       } else {
//         throw response.data['message'];
//       }
//     } on DioError catch (error) {
//       handleExceptionError(error);
//       return null;
//     }
//   }

//   void handleExceptionError(error) {
//     if (error.message.contains('timed out')) {
//       throw 'Error Connecting to server!!';
//     } else if (error.message.contains('SocketException')) {
//       throw 'No internet connection!!';
//     }
//     throw error.message;
//   }
// }
