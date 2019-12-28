import 'package:fatburger/JSON_DATA/repository/repositories.dart';

import 'package:fatburger/MODEL/Get_Cart_Model2.dart';


import 'package:rxdart/rxdart.dart';

class GetCartBloc {
  final _repository = Repository();
  final _getCartFetcher = PublishSubject<GetCartModel2>();

  Observable<GetCartModel2> get getAllCartItems => _getCartFetcher.stream;

  fetchAllGetCartItem() async {
    GetCartModel2 categoryModel = await _repository.fetchAllGetCartItems();
    _getCartFetcher.sink.add(categoryModel);
  }
addToCart(var productId,var quantity)  {
    _repository.addToCart(productId, quantity);
  }
  removeToCart(var productId,var quantity)  {
    _repository.removeToCart(productId, quantity);
  }
  
  dispose() async {
    await _getCartFetcher.drain();
    _getCartFetcher.close();
  }
}

final getCartBloc = GetCartBloc();
