import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';
import 'package:iad_advertiser/model/mappers/AdvertisingChannelTypeMapper.dart';

class CompositeAdvertisingChannel extends AdvertisingChannel {
  List<AdvertisingChannel> advertisingBillboards;
  int numberOfVisitorsPerDay;
  double _cost;

  /*CompositeAdvertisingChannel(String name, String imageSrc, String description,AdvertisingChannelType type) : super(name, imageSrc, description, type){
    advertisingBillboards = List();
  }*/

  /*CompositeAdvertisingChannel.withNumberOfAds(String name, String imageSrc, String description,AdvertisingChannelType type,int numberOfAds): super.withNumberOfAds(name, imageSrc, description, type, numberOfAds){
    advertisingBillboards = List();
  }*/

  CompositeAdvertisingChannel(
      String id,
      String name,
      String imageSrc,
      String description,
      AdvertisingChannelType type,
      int numberOfAds,
      int numberOfVisitorsPerDay)
      : super(id, name, imageSrc, description, type, numberOfAds) {
    advertisingBillboards = List();
  }

  CompositeAdvertisingChannel.fromJson(String id,Map<String, dynamic> document)
      : super(id, document["name"], document["image"],document["description"],AdvertisingChannelTypeMapper.mapFromString(document["type"]),int.parse(document["number_of_ads"])) {
    numberOfVisitorsPerDay = int.parse(document["number_of_visitors"]);
    advertisingBillboards = List();
  }

  void addAdvertisingChannel(AdvertisingChannel advertisingChannel) {
    if (advertisingChannel != null &&
        !advertisingBillboards.contains(advertisingChannel))
      advertisingBillboards.add(advertisingChannel);
  }

  void removeAdvertisingChannel(AdvertisingChannel advertisingChannel) {
    if (advertisingChannel != null &&
        advertisingBillboards.contains(advertisingChannel))
      advertisingBillboards.remove(advertisingChannel);
  }

  @override
  double calculateCost() {
    for (final adChannel in advertisingBillboards)
      _cost += adChannel.calculateCost();
    return _cost;
  }
}
