  
import 'dart:async';
import 'package:kyankafe/JSON_DATA/repository/repositories.dart';
import 'package:kyankafe/MODEL/Post_cart_model.dart';



class RegistrationBloc {
  final _repository = Repository();

registraionPost(var name,password,phone,image) {
    _repository.registraionPost(name,password,phone,image);
  }
}

final registrationBloc = RegistrationBloc();