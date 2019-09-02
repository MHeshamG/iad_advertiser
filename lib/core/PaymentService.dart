import 'dart:async';

import 'package:iad_advertiser/model/payment/PaymentMethod.dart';
import 'package:iad_advertiser/model/payment/PaymentType.dart';
import 'package:iad_advertiser/model/payment/WalletPaymentMethod.dart';

class PaymentService{
  PaymentMethod _defaultPayment;
  StreamController<PaymentMethod> paymentMethodController = StreamController<PaymentMethod>.broadcast();


  PaymentService(){
    _defaultPayment = WalletPaymentMethod(10000,PaymentType.WALLET);
  }


  PaymentMethod get defaultPayment => _defaultPayment;

  set defaultPayment(PaymentMethod paymentMethod) {
    _defaultPayment = paymentMethod;
    paymentMethodController.add(_defaultPayment);
  }


}