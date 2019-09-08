import 'dart:async';

import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/Billboard.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/model/User.dart';

class MockAdvertisingPlatform extends AdvertisingPlatform {
  @override
  Future<bool> cancelReservation(AdvertisingUnit advertisingUnit) {
    // TODO: implement cancelReservation
    return null;
  }



  @override
  Future<List<AdvertisingUnit>> fetchPreviousAds(User user) {
    // TODO: implement fetchAdvertisingHistory
    return null;
  }

  @override
  Future<List<AdvertisingChannel>> fetchAdvertisingPlaces() {
    CompositeAdvertisingChannel mallOfArabia = CompositeAdvertisingChannel("1",
        "Mall Of Arabia",
        "https://images.unsplash.com/photo-1518296968927-03cb25efaa54?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
        "Second Biggest Mall In Egypt",
        AdvertisingChannelType.Mall,200,1000);

    List<CompositeAdvertisingChannel> entities = [
      mallOfArabia,
      CompositeAdvertisingChannel("2",
          "Festival Mall",
          "https://images.unsplash.com/photo-1519567241046-7f570eee3ce6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1216&q=80",
          "New Cairo Mall",
          AdvertisingChannelType.Mall,300,1000),
      CompositeAdvertisingChannel("3",
          "Mall Of Egypt",
          "https://images.unsplash.com/photo-1533481405265-e9ce0c044abb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80",
          "Biggest Mall In Egypt",
          AdvertisingChannelType.Mall,200,1000),
      CompositeAdvertisingChannel("4",
          "Cairo Airport",
          "https://images.unsplash.com/photo-1543159821-9161ad7d5682?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
          "Capital Airport",
          AdvertisingChannelType.Airport,200,1000)
    ];
    Completer<List<AdvertisingChannel>> completer = Completer();
    completer.complete(entities);
    return completer.future;
  }

  @override
  Future<List<AdvertisingChannel>> fetchBillboardsAtAdvertisingPlace(
      String placeId) {
    List<AdvertisingChannel> entities = [
      /*Billboard.withCost(1,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.Hot,100,1000,50),
      Billboard.withCost(2,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.Hot,100,1000,50),
      Billboard.withCost(3,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.Top,100,1000,50),
      Billboard.withCost(4,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Billboard,AdvertisingChannelTag.Eco,100,1000,50),
      Billboard.withCost(5,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.Eco,100,1000,50),
      Billboard.withCost(6,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Billboard,AdvertisingChannelTag.Top,100,1000,50),
      Billboard.withCost(7,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.Hot,100,1000,50),
      Billboard.withCost(8,"Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.Hot,100,1000,50),*/
    ];
    Completer<List<AdvertisingChannel>> completer = Completer();
    completer.complete(entities);
    return completer.future;
  }

  @override
  Future<bool> reserveAdvertisingChannel(AdvertisingUnit advertisingUnit,String userId) {
    // TODO: implement reserveAdvertisingChannel
    return null;
  }

  @override
  Future<bool> isBillboardAvailable(String billboardId, AdTimeInterval adTimeInterval) {
    bool isAvailable;
    AdvertisingUnitsHandler advertisingUnitsHandler = locator<AdvertisingUnitsHandler>();
    isAvailable = !advertisingUnitsHandler.isBillboardReserved(billboardId,adTimeInterval);
    Completer<bool> completer = Completer();
    Future.delayed(Duration(seconds: 1));
    completer.complete(isAvailable);
    return completer.future;
  }

  @override
  Future<List<AdvertisingUnit>> fetchAdsForThisUser(User user) {
    // TODO: implement fetchLiveAds
    return null;
  }

  @override
  Future<List<AdvertisingUnit>> fetchUpComingAds(User user) {
    // TODO: implement fetchUpComingAds
    return null;
  }
}
