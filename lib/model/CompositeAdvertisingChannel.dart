import 'package:flutter/material.dart';

import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

class CompositeAdvertisingChannel extends AdvertisingChannel{
  List<AdvertisingChannel> advertisingBillboards;

  CompositeAdvertisingChannel(String name, String imageSrc, String quote,AdvertisingChannelType type) : super(name, imageSrc, quote, type){
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


}

