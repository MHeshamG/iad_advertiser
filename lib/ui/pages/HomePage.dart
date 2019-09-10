import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/view_models/HomePageViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePageViewModel homePageViewModel = locator<HomePageViewModel>();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
      onModelReady: (homePageViewModel) {
        homePageViewModel.fetchPlacesToAdvertiseAt();
      },
      builder: (BuildContext context, HomePageViewModel viewModel,
              Widget child) =>
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.pink),
              centerTitle: true,
              title: Text(
                "Home",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.CHECKOUT_PAGE);
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/card.png")))),
                  ),
                )
              ],
              elevation: 1.0,
            ),
            drawer: Drawer(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    DrawerHeader(
                      padding: EdgeInsets.all(0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height ,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color:AppColors.pink,width: 2.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left:4.0,right: 4.0,top: 4.0,),
                                        child: Text(
                                          Provider.of<User>(context).name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:4.0,right: 4.0,top: 4.0,),
                                        child: Text(
                                          Provider.of<User>(context).email,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          )),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,colors: [AppColors.appThemeColor,AppColors.darkPurple]),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.ad,
                        color: AppColors.appThemeColor,
                      ),
                      title: Text(
                        'Your Ads',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.ADS_PAGE);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.appThemeColor,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.PROFILE_PAGE);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.wallet,
                        color: AppColors.appThemeColor,
                      ),
                      title: Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.Wallet_PAGE);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.help,
                        color: AppColors.appThemeColor,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.Wallet_PAGE);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.local_offer,
                        color: AppColors.appThemeColor,
                      ),
                      title: Text(
                        'Promo',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.Wallet_PAGE);
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: Center(
                child: viewModel.state == ViewState.BUSY
                    ? CircularProgressIndicator()
                    : Container(
                        color: Colors.white,
                        child: ListView.builder(
                            itemCount: viewModel.placesToAdvertiseAt.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context,
                                      Routes
                                          .COMPOSITE_ADVERTISING_CHANNEL_DETAILS,
                                      arguments:
                                          viewModel.placesToAdvertiseAt[index]);
                                },
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(viewModel
                                          .placesToAdvertiseAt[index].imageSrc),
                                      Container(
                                        color: AppColors.appThemeColor,
                                        child: ListTile(
                                          leading:
                                              AdvertisingChannelTypeMapperToIcon
                                                  .map(viewModel
                                                      .placesToAdvertiseAt[
                                                          index]
                                                      .type),
                                          title: Text(
                                            viewModel.placesToAdvertiseAt[index]
                                                .name,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          subtitle: Text(
                                              viewModel
                                                  .placesToAdvertiseAt[index]
                                                  .description,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                ),
                              );
                            }),
                      ),
              ),
            ),
          ),
    );
  }
}
