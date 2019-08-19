
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

class CompositeAdvertisingChannel extends AdvertisingChannel{
  List<AdvertisingChannel> advertisingBillboards;
  double _cost;

  CompositeAdvertisingChannel(String name, String imageSrc, String quote,AdvertisingChannelType type) : super(name, imageSrc, quote, type){
    advertisingBillboards = List();
  }

  CompositeAdvertisingChannel.withNumberOfAds(String name, String imageSrc, String quote,AdvertisingChannelType type,int numberOfAds): super.withNumberOfAds(name, imageSrc, quote, type, numberOfAds){
    advertisingBillboards = List();
  }


  void addAdvertisingChannel(AdvertisingChannel advertisingChannel){
    if(advertisingChannel!=null && !advertisingBillboards.contains(advertisingChannel))
      advertisingBillboards.add(advertisingChannel);
  }

  void removeAdvertisingChannel(AdvertisingChannel advertisingChannel){
    if(advertisingChannel!=null && advertisingBillboards.contains(advertisingChannel))
      advertisingBillboards.remove(advertisingChannel);
  }

  @override
  double calculateCost() {
    for(final adChannel in advertisingBillboards)
      _cost+=adChannel.calculateCost();
    return _cost;
  }


}

