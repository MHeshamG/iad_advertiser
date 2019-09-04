import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';

class AdvertisingChannelTagMapper{

  static AdvertisingChannelTag mapFromString(String advertisingChannelTag){
    switch(advertisingChannelTag){
      case "hot":
        return AdvertisingChannelTag.Hot;
      case "eco":
        return AdvertisingChannelTag.Eco;
      case "top":
        return AdvertisingChannelTag.Top;
    }
  }
}