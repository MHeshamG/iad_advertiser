import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/model/payment/CreditCardPaymentMethod.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class CreditCardWidget extends StatelessWidget{
  Color backgroundColor;
  CreditCardPaymentMethod creditCardPaymentMethod;
  IconData creditCardType;


  CreditCardWidget(this.backgroundColor, this.creditCardPaymentMethod,this.creditCardType);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: backgroundColor,
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Stack(

            children:<Widget>[
              Image(image: AssetImage("images/world.png"),color: Colors.white.withOpacity(0.3),)
              ,Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Icon(
                          creditCardType,
                          color: Colors.white,
                          size: 32.0,
                        )),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Credit Number",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                creditCardPaymentMethod.creditCardNumber,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Name",style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w200),),
                              Text(creditCardPaymentMethod.creditCardHolderName,style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w300),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Date",style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w200),),
                              Text(creditCardPaymentMethod.endDate,style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w300),),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

}