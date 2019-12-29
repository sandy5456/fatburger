import 'dart:async';

import 'package:kyankafe/JSON_DATA/repository/repositories.dart';

class CheakOutBloc {
  final _repository = Repository();

  addPostData(String phone, String dyningnumber, String dyningplace) {
    _repository.addPostData(phone, dyningnumber, dyningplace);
  }
}

final cheakOutBloc = CheakOutBloc();
