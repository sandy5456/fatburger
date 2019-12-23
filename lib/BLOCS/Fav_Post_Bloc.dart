import 'package:fatburger/JSON_DATA/providers/Cart_api.dart';
import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/Cart_Model.dart';
import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/MODEL/New_model_Get_cart.dart';

import 'package:rxdart/rxdart.dart';

class FavPostBloc {
  final _repository = Repository();
  final _cartFetcher = PublishSubject<GetCartModel2>();


  Observable<GetCartModel2> get allCartItems => _cartFetcher.stream;

  fetchCartItems(String phoneNnumber) async {
    GetCartModel2 cartModel =
        await _repository.fetchAllCartItems(phoneNnumber);
    _cartFetcher.sink.add(cartModel);
  }

  addproductToFav(var productId, var phone)  {
    _repository.addProductToFav(productId, phone);
  }

  removeProductFromFav(var productId) {
    _repository.removeProductFromFav(productId);
  }

  dispose() async {
    await _cartFetcher.drain();
    _cartFetcher.close();
  }
}

final favPostBloc = FavPostBloc();