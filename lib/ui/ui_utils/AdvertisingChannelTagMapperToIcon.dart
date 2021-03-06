import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';

class AdvertisingChannelTagMapperToIcon {
  static Widget map(AdvertisingChannelTag tag) {
    switch (tag) {
      case AdvertisingChannelTag.Hot:
        return _createIcon(Icons.whatshot, "Hot", Colors.redAccent);
      case AdvertisingChannelTag.Top:
        return _createIcon(Icons.star, "Top", Colors.orangeAccent);
      case AdvertisingChannelTag.Eco:
        return _createIcon(Icons.attach_money, "Eco", Colors.green);
    }
  }

  static Icon mapToIcon(AdvertisingChannelTag tag) {
    switch (tag) {
      case AdvertisingChannelTag.Hot:
        return Icon(
          Icons.whatshot,
          color: Colors.redAccent,
          size: 50.0,
        );
      case AdvertisingChannelTag.Top:
        return Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 50.0,
        );
      case AdvertisingChannelTag.Eco:
        return Icon(
          Icons.attach_money,
          color: Colors.green,
          size: 50.0,
        );
    }
  }

  static Widget _createIcon(IconData icon, String txt, Color color) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
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
