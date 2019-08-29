import 'package:iad_advertiser/model/payment/PaymentType.dart';

abstract class PaymentMethod {
  PaymentType type;

  PaymentMethod(this.type);
}
