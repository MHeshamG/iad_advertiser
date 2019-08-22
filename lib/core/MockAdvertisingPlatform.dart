import 'dart:async';

import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
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
  Future<List<AdvertisingUnit>> fetchAdvertisingHistory(User user) {
    // TODO: implement fetchAdvertisingHistory
    return null;
  }

  @override
  Future<List<AdvertisingChannel>> fetchAdvertisingPlaces() {
    CompositeAdvertisingChannel mallOfArabia = CompositeAdvertisingChannel.withNumberOfAds(
        "Mall Of Arabia",
        "https://images.unsplash.com/photo-1518296968927-03cb25efaa54?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
        "Second Biggest Mall In Egypt",
        AdvertisingChannelType.Mall,200);

    List<CompositeAdvertisingChannel> entities = [
      mallOfArabia,
      CompositeAdvertisingChannel.withNumberOfAds(
          "Festival Mall",
          "https://images.unsplash.com/photo-1519567241046-7f570eee3ce6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1216&q=80",
          "New Cairo Mall",
          AdvertisingChannelType.Mall,300),
      CompositeAdvertisingChannel.withNumberOfAds(
          "Mall Of Egypt",
          "https://images.unsplash.com/photo-1533481405265-e9ce0c044abb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80",
          "Biggest Mall In Egypt",
          AdvertisingChannelType.Mall,200),
      CompositeAdvertisingChannel.withNumberOfAds(
          "Cairo Airport",
          "https://images.unsplash.com/photo-1543159821-9161ad7d5682?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
          "Capital Airport",
          AdvertisingChannelType.Airport,200)
    ];
    Completer<List<AdvertisingChannel>> completer = Completer();
    completer.complete(entities);
    return completer.future;
  }

  @override
  Future<List<AdvertisingChannel>> fetchBillboardsAtAdvertisingPlace(
      int placeId) {
    List<AdvertisingChannel> entities = [
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.Hot,100,1000,50),
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.Hot,100,1000,50),
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.Star,100,1000,50),
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Billboard,AdvertisingChannelTag.Eco,100,1000,50),
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.Eco,100,1000,50),
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Billboard,AdvertisingChannelTag.Star,100,1000,50),
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.Hot,100,1000,50),
      Billboard.withCost("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.Hot,100,1000,50),
    ];
    Completer<List<AdvertisingChannel>> completer = Completer();
    completer.complete(entities);
    return completer.future;
  }

  @override
  Future<void> reserveAdvertisingChannel(AdvertisingUnit advertisingUnit) {
    // TODO: implement reserveAdvertisingChannel
    return null;
  }

  @override
  Future<bool> checkBillboardAvailability(int billboardId, DateTime adStartDateTime, DateTime adEndDateTime) {
    bool isAvailable = true;
    Completer<bool> completer = Completer();
    Future.delayed(Duration(seconds: 1));
    completer.complete(isAvailable);
    return completer.future;
  }
}
