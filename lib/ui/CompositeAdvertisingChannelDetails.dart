import 'package:flutter/material.dart';
import 'package:iad_advertiser/core/view_models/CompositeAdvertisingChannelDetailsViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTagMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';

class CompositeAdvertisingChannelDetails extends StatelessWidget {
  CompositeAdvertisingChannel advertisingChannel;

  CompositeAdvertisingChannelDetails(this.advertisingChannel);

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
          advertisingChannel.advertisingBillboards.isEmpty)
        advertisingChannel.advertisingBillboards
            .addAll(viewModel.billboardsAtThisPlace);
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
                                  gradient: LinearGradient(colors: [
                                    Colors.pink,
                                    Colors.deepPurple
                                  ])),
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.3)),
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 75.0,
                                          height: 75.0,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "images/ground_billboard.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "${advertisingChannel.advertisingBillboards.length}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Text(
                                            "Billboards",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                advertisingChannel.advertisingBillboards.length,
                            itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: ListTile(
                                      leading:
                                          AdvertisingChannelTypeMapperToIcon
                                              .map(advertisingChannel
                                                  .advertisingBillboards[index]
                                                  .type),
                                      title: Text(advertisingChannel
                                          .advertisingBillboards[index].name),
                                      subtitle: Text(advertisingChannel
                                          .advertisingBillboards[index].qoute),
                                      trailing:
                                          AdvertisingChannelTagMapperToIcon.map(
                                              advertisingChannel
                                                  .advertisingBillboards[index]
                                                  .tag)),
                                ),
                          ),
                        ),
                      ],
                    )));
    });
  }
}
