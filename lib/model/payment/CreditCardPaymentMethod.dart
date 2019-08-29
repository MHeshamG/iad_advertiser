import 'package:iad_advertiser/model/payment/PaymentMethod.dart';
import 'package:iad_advertiser/model/payment/PaymentType.dart';

class CreditCardPaymentMethod extends PaymentMethod{
  String creditCardNumber;
  String endDate;
  String creditCardHolderName;

  CreditCardPaymentMethod(
      this.creditCardNumber, this.endDate, this.creditCardHolderName,PaymentType type):super(type);
}
