import 'package:iad_advertiser/model/Ad.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';

class AdvertisingUnit {
  List<AdvertisingChannel> advertisingChannels;
  AdTimeInterval adTimeInterval;
  Ad ad;

  AdvertisingUnit(this.adTimeInterval) {
    advertisingChannels = [];
  }

  @override
  String toString() {
    return 'AdvertisingUnit{advertisingChannels: ${advertisingChannels.length}, adTimeInterval: ${adTimeInterval.toString()}}';
  }

  int getNumberOfBillboards() => advertisingChannels.length;


  double calculateTotalCost() {
    double totalCost = 0;
    totalCost =  advertisingChannels.fold(totalCost, (totalCost,advertisingChannel)=>totalCost+=advertisingChannel.calculateCost());
    return totalCost;
  }

  String getAdTimeIntervalStarting() {
    String startingDateTime = adTimeInterval.adStartingDateTime.toString();
    return startingDateTime.split(" ").first +" "+
        startingDateTime.split(" ").last.split(".").first.substring(0,5);
  }

  String getAdTimeIntervalEnding() {
    String endingDateTime = adTimeInterval.adEndingDateTime.toString();
    return endingDateTime.split(" ").first +" "+
        endingDateTime.split(" ").last.split(".").first.substring(0,5);
  }
}
