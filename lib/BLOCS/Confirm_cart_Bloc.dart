
import 'package:kyankafe/JSON_DATA/repository/repositories.dart';
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';

import 'package:rxdart/rxdart.dart';

class ConfirmationCartBloc {
  final _repository = Repository();
  final _getCartFetcher = PublishSubject<GetCartModel2>();

  Observable<GetCartModel2> get getAllCartItems => _getCartFetcher.stream;

  fetchAllConfirmCartItem() async {
    GetCartModel2 categoryModel = await _repository.fetchAllConfirmCartItem();
    _getCartFetcher.sink.add(categoryModel);
  }
}

final confirmationCartBloc = ConfirmationCartBloc();
