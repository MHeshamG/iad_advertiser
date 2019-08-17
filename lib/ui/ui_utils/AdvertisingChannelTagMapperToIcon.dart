import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';

class AdvertisingChannelTagMapperToIcon {
  static Widget map(AdvertisingChannelTag tag) {
    switch (tag) {
      case AdvertisingChannelTag.HOT:
        return _createIcon(Icons.whatshot,"Hot",Colors.redAccent);
      case AdvertisingChannelTag.STAR:
        return _createIcon(Icons.star,"Star",Colors.orangeAccent);
      case AdvertisingChannelTag.ECONOMY:
        return _createIcon(Icons.attach_money,"Eco",Colors.green);
    }
  }

  static Widget _createIcon(IconData icon,String txt,Color color){
    return Column(
      children: <Widget>[
        Icon(icon,
          color: color,
        ),
        Text(
          txt,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}