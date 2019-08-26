import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: AppColors.light_purple,
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
                  color: AppColors.light_purple,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
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
                    )
                  ],
                ),
              ),
              _buildCarousel(context),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onPressed: () {},
                color: AppColors.light_purple,
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
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildVisaCardItem();
            },
          ),
        )
      ],
    );
  }

  Widget _buildWalletItem() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Wallet",
                  style: TextStyle(
                      color: AppColors.light_purple,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.wallet,
                      color: AppColors.light_purple,
                      size: 48.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "10,000",
                        style: TextStyle(
                            color: AppColors.light_purple,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        "EGP",
                        style: TextStyle(
                            color: AppColors.light_purple,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisaCardItem() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppColors.light_blue,
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
                      FontAwesomeIcons.ccVisa,
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
                            "**** **** **** 0956",
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
                          Text("MOHAMED HESHAM",style: TextStyle(
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
                          Text("12/19",style: TextStyle(
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
