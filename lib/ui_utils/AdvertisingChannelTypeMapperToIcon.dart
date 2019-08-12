
import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

class AdvertisingChannelTypeMapperToIcon{
  static IconData map(AdvertisingChannelType type){
    switch(type){
      case AdvertisingChannelType.Mall:
        return Icons.local_mall;
      case AdvertisingChannelType.Airport:
        return Icons.local_airport;
    }
  }
}