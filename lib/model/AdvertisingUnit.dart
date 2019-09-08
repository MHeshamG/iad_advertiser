import 'package:iad_advertiser/model/Ad.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';

class AdvertisingUnit {
  List<AdvertisingChannel> advertisingChannels;
  AdTimeInterval adTimeInterval;
  double _cost = 0;
  int _numberOfBillboards = 0;
  Ad ad;

  AdvertisingUnit(this.adTimeInterval) {
    advertisingChannels = [];
    ad = Ad();
  }

  AdvertisingUnit.fromJson(Map<String, dynamic>adUnitData) {
    _cost = adUnitData["cost"];
    _numberOfBillboards = adUnitData["number_of_billboards"];
    adTimeInterval =
        AdTimeInterval(adUnitData["start_datetime"].toDate(), adUnitData["end_datetime"].toDate());
    ad = Ad();
  }

  @override
  String toString() {
    return 'AdvertisingUnit{advertisingChannels: ${advertisingChannels
        .length}, adTimeInterval: ${adTimeInterval.toString()}}';
  }

  int getNumberOfBillboards() => _numberOfBillboards ==0?advertisingChannels.length:_numberOfBillboards;


  double get cost =>
      _cost == 0 ? advertisingChannels.fold(
          _cost,
              (totalCost, advertisingChannel) =>
          totalCost +=
              adTimeInterval.calculateTotalHours() *
                  advertisingChannel.calculateCost()) : _cost;


String getAdTimeIntervalStarting() {
  String startingDateTime = adTimeInterval.adStartingDateTime.toString();
  return startingDateTime
      .split(" ")
      .first +
      " " +
      startingDateTime
          .split(" ")
          .last
          .split(".")
          .first
          .substring(0, 5);
}

String getAdTimeIntervalEnding() {
  String endingDateTime = adTimeInterval.adEndingDateTime.toString();
  return endingDateTime
      .split(" ")
      .first +
      " " +
      endingDateTime
          .split(" ")
          .last
          .split(".")
          .first
          .substring(0, 5);
}

Map<String, dynamic> getAdUnitInJsonFormat() {
  return {
    "start_datetime":
    adTimeInterval.adStartingDateTime,
    "end_datetime": adTimeInterval.adEndingDateTime,
    "cost":cost,
    "number_of_billboards":getNumberOfBillboards()
  };
}}
