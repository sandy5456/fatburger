// import 'package:fatburger/JSON_DATA/providers/Cart_api.dart';
// import 'package:fatburger/JSON_DATA/repository/repositories.dart';
// import 'package:fatburger/MODEL/Cart_Model.dart';
// import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
// import 'package:fatburger/MODEL/New_model_Get_cart.dart';

// import 'package:rxdart/rxdart.dart';

// class CartBloc {
//   final _repository = Repository();
//   final _cartFetcher = PublishSubject<GetCartModel2>();


//   Observable<GetCartModel2> get allCartItems => _cartFetcher.stream;


//   // addToCart(String productId, String quantity)  {
//   //   _repository.addToCart(productId,quantity);
//   // }

//   // removeProductFromCart(String productId,String phone) {
//   //   _repository.removeProductFromCart(productId,phone);
//   // }

//   dispose() async {
//     await _cartFetcher.drain();
//     _cartFetcher.close();
//   }
// }

// final cartBloc = CartBloc();