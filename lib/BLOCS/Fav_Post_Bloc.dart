import 'package:fatburger/JSON_DATA/providers/Cart_api.dart';
import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/Cart_Model.dart';
import 'package:fatburger/MODEL/Get_Cart_Model2.dart';

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

  addproductToFav(String productId, String phone)  {
    _repository.addProductToFav(productId, phone);
  }

  removeProductFromFav(String productId,String phone) {
    _repository.removeProductFromFav(productId,phone);
  }

  dispose() async {
    await _cartFetcher.drain();
    _cartFetcher.close();
  }
}

final favPostBloc = FavPostBloc();