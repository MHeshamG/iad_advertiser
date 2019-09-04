import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';

import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

abstract class AdvertisingChannel {
  String id;
  String name;
  String imageSrc;
  String description;
  AdvertisingChannelType type;
  AdvertisingChannelTag tag;
  int numberOfAds;
  double _cost;
  int views;

  AdvertisingChannel(this.id, this.name, this.imageSrc,this.description,this.type, this.numberOfAds);
  AdvertisingChannel.withTag(this.name, this.imageSrc,this.description,this.type,this.tag);
  AdvertisingChannel.withCost(this.id,this.name, this.imageSrc,this.description,this.type,this.tag,this._cost,this.views,this.numberOfAds);


  @override
  double calculateCost() {
    return _cost;
  }
}

