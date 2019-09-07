import 'package:flutter/material.dart';
import 'package:iad_advertiser/core/view_models/CompositeAdvertisingChannelDetailsViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTagMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class AdvertisingPlaceDetailsPage extends StatelessWidget {
  CompositeAdvertisingChannel advertisingChannel;

  AdvertisingPlaceDetailsPage(this.advertisingChannel);

  @override
  Widget build(BuildContext context) {
    return BaseView<CompositeAdvertisingChannelDetailsViewModel>(
        onModelReady: (compositeAdvertisingChannelDetailsViewModel) {
      compositeAdvertisingChannelDetailsViewModel
          .fetchBillboardsAtThisPlace(advertisingChannel.id);
    }, builder: (BuildContext context,
            CompositeAdvertisingChannelDetailsViewModel viewModel,
            Widget child) {
      if (viewModel.state == ViewState.IDLE &&
          advertisingChannel.advertisingBillboards.isEmpty) {
        advertisingChannel.advertisingBillboards
            .addAll(viewModel.billboardsAtThisPlace);
      }
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1.0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            centerTitle: true,
            title: Text(
              "Billboards",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
            ),
          ),
          body: Container(
              color: Colors.white,
              child: Center(
                child: viewModel.state == ViewState.BUSY
                    ? CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.pink,
                                      AppColors.appThemeColor,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        advertisingChannel.name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          buildInfoText(
                                              advertisingChannel
                                                  .numberOfVisitorsPerDay,
                                              "Visitor"),
                                          buildDivider(),
                                          buildInfoText(
                                              advertisingChannel
                                                  .advertisingBillboards.length,
                                              "Billboards"),
                                          buildDivider(),
                                          buildInfoText(
                                              advertisingChannel.numberOfAds,
                                              "Ads"),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: advertisingChannel
                                  .advertisingBillboards.length,
                              itemBuilder: (context, index) =>
                                  buildBillboardListItem(context, index),
                            ),
                          ),
                        ],
                      ),
              )));
    });
  }

  Card buildBillboardListItem(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, Routes.BILLBOARD_PAGE,
                arguments: advertisingChannel.advertisingBillboards[index]);
          },
          leading: AdvertisingChannelTypeMapperToIcon.map(
              advertisingChannel.advertisingBillboards[index].type),
          title: Text(advertisingChannel.advertisingBillboards[index].name),
          subtitle:
              Text(advertisingChannel.advertisingBillboards[index].description),
          trailing: AdvertisingChannelTagMapperToIcon.map(
              advertisingChannel.advertisingBillboards[index].tag)),
    );
  }

  Container buildDivider() {
    return Container(
      height: 50,
      width: 0.5,
      color: Colors.white.withOpacity(0.5),
    );
  }

  Widget buildInfoText(int num, String txt) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "${num}",
          style: TextStyle(
              color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.w300),
        ),
        Text(
          txt,
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
