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


  AdvertisingChannel(this.name, this._imageSrc,this.qoute,this.type);
  AdvertisingChannel.withTag(this.name, this._imageSrc,this.qoute,this.type,this.tag);

  Image getImageForThisAdvertisingChannel(){
    if(_image == null)
      _image = Image.network(_imageSrc);
    return _image;
  }
}

