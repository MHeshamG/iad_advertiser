import 'package:flutter/material.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/view_models/HomePageViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

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
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: AppColors.appThemeColor,
                    ),
                  ),
                  ListTile(
                    title: Text('Your Ads'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.ADS_PAGE);
                    },
                  ),
                ],
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
