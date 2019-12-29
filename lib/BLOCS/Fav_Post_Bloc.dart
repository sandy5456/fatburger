

import 'package:kyankafe/JSON_DATA/repository/repositories.dart';
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';
import 'package:rxdart/rxdart.dart';

class FavPostBloc {
  final _repository = Repository();
  final _cartFetcher = PublishSubject<GetCartModel2>();


  Observable<GetCartModel2> get allCartItems => _cartFetcher.stream;

 

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