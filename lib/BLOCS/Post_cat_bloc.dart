  
import 'dart:async';
import 'package:kyankafe/JSON_DATA/repository/repositories.dart';
import 'package:kyankafe/MODEL/Post_cart_model.dart';



class PostCartBloc {
  final _repository = Repository();

  postcartData(PostCartModel postCartModel) {
    _repository.addPostCartData(postCartModel);
  }
}

final postCartBloc = PostCartBloc();