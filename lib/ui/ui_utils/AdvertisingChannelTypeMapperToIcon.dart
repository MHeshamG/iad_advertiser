import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

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
        return createIcon(AssetImage('images/billboard (4).png'));
      case AdvertisingChannelType.Billboard:
        return createIcon(AssetImage('images/billboard2.png'));
      case AdvertisingChannelType.DoubleBanner:
        return createIcon(AssetImage('images/banner1.png'));
    }
  }

  static Color mapColor(AdvertisingChannelType type) {
    switch (type) {
      case AdvertisingChannelType.Mall:
        return Colors.white;
      case AdvertisingChannelType.Airport:
        return Colors.white;
      default:
        return AppColors.appThemeColor;
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
