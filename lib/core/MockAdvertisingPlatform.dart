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
  Future<bool> checkBillboardAvailability(
      int billboardId, DateTime adDateTime) {
    // TODO: implement checkBillboardAvailability
    return null;
  }

  @override
  Future<List<AdvertisingUnit>> fetchAdvertisingHistory(User user) {
    // TODO: implement fetchAdvertisingHistory
    return null;
  }

  @override
  Future<List<AdvertisingChannel>> fetchAdvertisingPlaces() {
    CompositeAdvertisingChannel mallOfArabia = CompositeAdvertisingChannel(
        "Mall Of Arabia",
        "https://images.unsplash.com/photo-1518296968927-03cb25efaa54?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
        "Second Biggest Mall In Egypt",
        AdvertisingChannelType.Mall);

    List<CompositeAdvertisingChannel> entities = [
      mallOfArabia,
      CompositeAdvertisingChannel(
          "Festival Mall",
          "https://images.unsplash.com/photo-1519567241046-7f570eee3ce6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1216&q=80",
          "New Cairo Mall",
          AdvertisingChannelType.Mall),
      CompositeAdvertisingChannel(
          "Mall Of Egypt",
          "https://images.unsplash.com/photo-1533481405265-e9ce0c044abb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80",
          "Biggest Mall In Egypt",
          AdvertisingChannelType.Mall),
      CompositeAdvertisingChannel(
          "Cairo Airport",
          "https://images.unsplash.com/photo-1543159821-9161ad7d5682?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
          "Capital Airport",
          AdvertisingChannelType.Airport)
    ];
    Completer<List<AdvertisingChannel>> completer = Completer();
    completer.complete(entities);
    return completer.future;
  }

  @override
  Future<List<AdvertisingChannel>> fetchBillboardsAtAdvertisingPlace(
      int placeId) {
    List<AdvertisingChannel> entities = [
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.HOT),
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.HOT),
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Banner,AdvertisingChannelTag.STAR),
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Billboard,AdvertisingChannelTag.ECONOMY),
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.ECONOMY),
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.Billboard,AdvertisingChannelTag.STAR),
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.HOT),
      Billboard.withTag("Main Gate Billboard", null, "At the main gate of the mall ",
          AdvertisingChannelType.DoubleBanner,AdvertisingChannelTag.HOT),
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
}
