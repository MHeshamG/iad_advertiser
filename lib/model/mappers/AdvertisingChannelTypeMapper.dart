import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

class AdvertisingChannelTypeMapper{

  static AdvertisingChannelType mapFromString(String advertisingChannelType){
    switch(advertisingChannelType){
      case "mall":
        return AdvertisingChannelType.Mall;
      case "airport":
        return AdvertisingChannelType.Mall;

      case "banner":
        return AdvertisingChannelType.Banner;
      case "billboard":
        return AdvertisingChannelType.Billboard;
      case "double banner":
        return AdvertisingChannelType.DoubleBanner;
    }
  }
}