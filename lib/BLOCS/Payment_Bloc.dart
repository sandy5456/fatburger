import 'dart:async';

import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/Payment_model.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';



class PaymentBloc {
  final _repository = Repository();

  addPostData(PaymentModel paymentModel) {
    _repository.paymentData(paymentModel);
  }
}

final paymentBloc = PaymentBloc();
