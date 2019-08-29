import 'package:iad_advertiser/model/payment/PaymentMethod.dart';
import 'package:iad_advertiser/model/payment/PaymentType.dart';

class WalletPaymentMethod extends PaymentMethod{
  double amount;

  WalletPaymentMethod(this.amount,PaymentType type):super(type);
}
