import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';

import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

abstract class AdvertisingChannel {
  int id;
  String name;
  Image _image;
  String _imageSrc;
  String qoute;
  AdvertisingChannelType type;
  AdvertisingChannelTag tag;
  int numberOfAds;
  double _cost;
  int views;

  AdvertisingChannel(this.name, this._imageSrc,this.qoute,this.type);
  AdvertisingChannel.withTag(this.name, this._imageSrc,this.qoute,this.type,this.tag);
  AdvertisingChannel.withNumberOfAds(this.name, this._imageSrc,this.qoute,this.type,this.numberOfAds);
  AdvertisingChannel.withCost(this.id,this.name, this._imageSrc,this.qoute,this.type,this.tag,this._cost,this.views,this.numberOfAds);

  Image getImageForThisAdvertisingChannel(){
    if(_image == null)
      _image = Image.network(_imageSrc);
    return _image;
  }

  @override
  double calculateCost() {
    return _cost;
  }
}

