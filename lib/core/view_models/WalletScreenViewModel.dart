import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/PaymentService.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/payment/PaymentMethod.dart';

class WalletPageViewModel extends BaseViewModel{
  PaymentService paymentService = locator<PaymentService>();
  PaymentMethod defaultPaymentMethod;


  WalletPageViewModel(){
    defaultPaymentMethod = paymentService.defaultPayment;
  }

  void setDefaultPaymentMethod(PaymentMethod paymentMethod){
    setState(ViewState.BUSY);
    paymentService.defaultPayment = paymentMethod;
    defaultPaymentMethod = paymentMethod;
    setState(ViewState.IDLE);
  }
}