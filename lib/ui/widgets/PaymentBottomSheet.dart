import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/core/PaymentService.dart';
import 'package:iad_advertiser/core/view_models/PaymentBottomSheetViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:iad_advertiser/model/payment/PaymentMethod.dart';
import 'package:iad_advertiser/model/payment/PaymentType.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';
import 'package:provider/provider.dart';

class PaymentBottomSheet extends StatelessWidget {
  AdvertisingUnit advertisingUnit;
  bool isPayButtonPressed = false;

  PaymentBottomSheet(this.advertisingUnit);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<PaymentMethod>(
      initialData: locator<PaymentService>().defaultPayment,
      builder: (BuildContext context) =>
          locator<PaymentService>().paymentMethodController.stream,
      child: Consumer<PaymentMethod>(builder:
          (BuildContext context, PaymentMethod paymentMethod, Widget child) {
        print(paymentMethod.type);
        return Container(
          height: MediaQuery.of(context).size.height * 0.38,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors.appThemeColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      advertisingUnit.calculateTotalCost().toString(),
                      style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    Text(
                      "EGP",
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.Wallet_PAGE);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Payment Method: ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18.0),
                      ),
                      buildPaymentMethodIcon(paymentMethod)
                    ],
                  ),
                ),
              ),
              BaseView(
                builder: (BuildContext context,
                        PaymentBottomSheetViewModel viewModel, Widget child) =>
                    viewModel.state == ViewState.BUSY
                        ? CircularProgressIndicator()
                        : isPayButtonPressed
                            ? Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Your Advertising unit is reserved and ready to go live",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.light_green),
                                ),
                              )
                            : FlatButton(
                                onPressed: () {
                                  isPayButtonPressed = true;
                                  viewModel.payAndReserve(advertisingUnit,Provider.of<User>(context).id);

                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                color: AppColors.light_green,
                                child: Text("Pay",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.appThemeColor)),
                              ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget buildPaymentMethodIcon(PaymentMethod paymentMethod) {
    Widget icon;
    switch (paymentMethod.type) {
      case PaymentType.WALLET:
        icon = Icon(
          FontAwesomeIcons.wallet,
          color: Colors.white,
        );
        break;
      case PaymentType.VISA:
        icon = Icon(
          FontAwesomeIcons.ccVisa,
          color: Colors.white,
        );
        break;
      case PaymentType.MASTER:
        icon = Icon(
          FontAwesomeIcons.ccMastercard,
          color: Colors.white,
        );
        break;
    }
    return icon;
  }
}
