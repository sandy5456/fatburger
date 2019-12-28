import 'dart:async';

import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';



class CheakOutBloc {
  final _repository = Repository();

  addPostData(String phone,String dyningnumber,String dyningplace) {
    _repository.addPostData(phone,dyningnumber,dyningplace);
  }
}

final cheakOutBloc = CheakOutBloc();
