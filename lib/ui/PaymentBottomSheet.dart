import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class PaymentBottomSheet extends StatelessWidget {
  double totalCost;

  PaymentBottomSheet(this.totalCost);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.38,
        width: MediaQuery
            .of(context)
            .size
            .width,
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
                    totalCost.toString(),
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
                onTap: (){
                  Navigator.pushNamed(context,Routes.Wallet_PAGE);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Payment Method: ", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0),),
                    Icon(FontAwesomeIcons.ccVisa, color: Colors.white,)
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {

              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: Colors.white,
              child: Text("Pay",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      color: AppColors.appThemeColor)),
            )
          ],
        ));
  }
}