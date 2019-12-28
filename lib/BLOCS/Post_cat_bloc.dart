  
import 'dart:async';

import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/Post_cart_model.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';



class PostCartBloc {
  final _repository = Repository();

  postcartData(PostCartModel postCartModel) {
    _repository.addPostCartData(postCartModel);
  }
}

final postCartBloc = PostCartBloc();