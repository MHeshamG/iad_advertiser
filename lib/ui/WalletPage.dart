import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/model/payment/CreditCardPaymentMethod.dart';
import 'package:iad_advertiser/model/payment/PaymentMethod.dart';
import 'package:iad_advertiser/model/payment/PaymentType.dart';
import 'package:iad_advertiser/model/payment/WalletPaymentMethod.dart';
import 'package:iad_advertiser/ui/CreditCardWidget.dart';
import 'package:iad_advertiser/ui/WalletWidget.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class WalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WalletPageState();
}

class WalletPageState extends State<WalletPage> {
  List<Widget> paymentsCardsList;
  List<PaymentMethod> paymentsMethods = [
    WalletPaymentMethod(10000, PaymentType.WALLET),
    CreditCardPaymentMethod("**** **** **** 9056", "12/19",
        "MOHAMED HESHAM GAMAL", PaymentType.MASTER),
    CreditCardPaymentMethod("**** **** **** 8042", "05/20",
        "MOHAMED HESHAM GAMAL", PaymentType.VISA)
  ];

  PaymentMethod defaultPaymentMethod;
  int currentPaymentCardIndex;

  @override
  void initState() {
    defaultPaymentMethod = paymentsMethods[0];
  }

  @override
  Widget build(BuildContext context) {
    paymentsCardsList = [
      WalletWidget(paymentsMethods[0]),
      CreditCardWidget(AppColors.light_blue, paymentsMethods[1],
          FontAwesomeIcons.ccMastercard),
      CreditCardWidget(
          AppColors.pink, paymentsMethods[2], FontAwesomeIcons.ccVisa)
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: AppColors.appThemeColor,
        centerTitle: true,
        title: Text(
          "Wallet",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                  color: AppColors.appThemeColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Payment Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 24.0),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Mohamed Hesham Gamal",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 80, child: Divider(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Default Payment",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        buildDefaultPaymentInfoWidget(defaultPaymentMethod),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          onPressed: () {},
                          color: AppColors.light_green,
                          child: Text(
                            "Add New Payment Method",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: AppColors.light_purple),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _buildCarousel(context),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onPressed: () {
                  print("pressed " + currentPaymentCardIndex.toString());
                  setState(() {
                    defaultPaymentMethod =
                        paymentsMethods[currentPaymentCardIndex];
                  });
                },
                color: AppColors.appThemeColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Set As Default",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget buildDefaultPaymentInfoWidget(PaymentMethod paymentMethod) {
    IconData icon;
    String txtInfo;
    String txtInfo2;
    switch (paymentMethod.type) {
      case PaymentType.WALLET:
        icon = FontAwesomeIcons.wallet;
        txtInfo = (paymentMethod as WalletPaymentMethod).amount.toString();
        txtInfo2 = "EGP";
        break;
      case PaymentType.VISA:
        icon = FontAwesomeIcons.ccVisa;
        txtInfo = (paymentMethod as CreditCardPaymentMethod)
            .creditCardNumber
            .split(" ")
            .last;
        txtInfo2 = (paymentMethod as CreditCardPaymentMethod).endDate;
        break;
      case PaymentType.MASTER:
        icon = FontAwesomeIcons.ccMastercard;
        txtInfo = (paymentMethod as CreditCardPaymentMethod)
            .creditCardNumber
            .split(" ")
            .last;
        txtInfo2 = (paymentMethod as CreditCardPaymentMethod).endDate;
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            txtInfo,
            style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            txtInfo2,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemCount: paymentsCardsList.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              return paymentsCardsList[itemIndex];
            },
            onPageChanged: (itemIndex) {
              currentPaymentCardIndex = itemIndex;
            },
          ),
        )
      ],
    );
  }
}
