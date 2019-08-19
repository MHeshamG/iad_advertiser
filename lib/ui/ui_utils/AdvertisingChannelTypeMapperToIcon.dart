import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

class AdvertisingChannelTypeMapperToIcon {
  static Widget map(AdvertisingChannelType type) {
    switch (type) {
      case AdvertisingChannelType.Mall:
        return Icon(
          Icons.local_mall,
          color: Colors.white,
        );
      case AdvertisingChannelType.Airport:
        return Icon(
          Icons.local_airport,
          color: Colors.white,
        );
      case AdvertisingChannelType.Banner:
        return createIcon(AssetImage('images/banner.png'));
      case AdvertisingChannelType.Billboard:
        return createIcon(AssetImage('images/big_banner.png'));
      case AdvertisingChannelType.DoubleBanner:
        return createIcon(AssetImage('images/double_banner.png'));
    }
  }

  static Color mapColor(AdvertisingChannelType type) {
    switch (type) {
      case AdvertisingChannelType.Mall:
        return Colors.white;
      case AdvertisingChannelType.Airport:
        return Colors.white;
      case AdvertisingChannelType.Banner:
        return Color(0xFFF8CE00);
      case AdvertisingChannelType.Billboard:
        return Color(0xFF07DAF7);
      case AdvertisingChannelType.DoubleBanner:
        return Color(0xFF07DAF7);
    }
  }

  static Widget createIcon(AssetImage icon){
    return Container(
      width: 50.0,
      height: 50.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: icon,
          ),
        ),
      ),
    );
  }
}
