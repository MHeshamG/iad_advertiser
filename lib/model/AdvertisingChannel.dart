import 'package:flutter/material.dart';

import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

abstract class AdvertisingChannel {
  String name;
  Image _image;
  String _imageSrc;
  String qoute;
  AdvertisingChannelType type;


  AdvertisingChannel(this.name, this._imageSrc,this.qoute,this.type);

  Image getImageForThisAdvertisingChannel(){
    if(_image == null)
      _image = Image.network(_imageSrc);
    return _image;
  }
}

