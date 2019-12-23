import 'package:fatburger/JSON_DATA/providers/Cart_api.dart';
import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/Cart_Model.dart';
import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/MODEL/New_model_Get_cart.dart';

import 'package:rxdart/rxdart.dart';

class CartBloc {
  final _repository = Repository();
  final _cartFetcher = PublishSubject<GetCartModel2>();


  Observable<GetCartModel2> get allCartItems => _cartFetcher.stream;

  fetchCartItems(String phoneNnumber) async {
    GetCartModel2 cartModel =
        await _repository.fetchAllCartItems(phoneNnumber);
    _cartFetcher.sink.add(cartModel);
  }

  addproductToCart(String productId, String phone,String quantity)  {
    _repository.addProductToCart(productId, phone,quantity);
  }

  removeProductFromCart(String productId,String phone) {
    _repository.removeProductFromCart(productId,phone);
  }

  dispose() async {
    await _cartFetcher.drain();
    _cartFetcher.close();
  }
}

final cartBloc = CartBloc();