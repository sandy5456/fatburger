import 'dart:async';

import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';



class CheakOutBloc {
  final _repository = Repository();

  addPostData(CheckOutModel checkOutModel) {
    _repository.addPostData(checkOutModel);
  }
}

final cheakOutBloc = CheakOutBloc();
