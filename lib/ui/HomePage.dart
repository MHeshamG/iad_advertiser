import 'package:flutter/material.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/view_models/HomePageViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';

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
              title: Center(
                  child: Text("Home",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300))),
              elevation: 1.0,
            ),
            body: Center(
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
                                    viewModel.placesToAdvertiseAt[index]
                                        .getImageForThisAdvertisingChannel(),
                                    Container(
                                      color: Color(0xFFE23A7E),
                                      child: ListTile(
                                        leading:
                                            AdvertisingChannelTypeMapperToIcon
                                                .map(viewModel
                                                    .placesToAdvertiseAt[index]
                                                    .type),
                                        title: Text(
                                          viewModel
                                              .placesToAdvertiseAt[index].name,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        subtitle: Text(
                                            viewModel.placesToAdvertiseAt[index]
                                                .qoute,
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
    );
  }
}
