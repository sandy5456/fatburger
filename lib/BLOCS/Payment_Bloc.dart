import 'dart:async';

import 'package:kyankafe/JSON_DATA/repository/repositories.dart';
import 'package:kyankafe/MODEL/Payment_model.dart';



class PaymentBloc {
  final _repository = Repository();

  addPostData(PaymentModel paymentModel) {
    _repository.paymentData(paymentModel);
  }
}

final paymentBloc = PaymentBloc();
