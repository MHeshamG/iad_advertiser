import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/ui/CompositeAdvertisingChannelDetails.dart';
import 'package:iad_advertiser/ui/HomePage.dart';

import 'Routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.COMPOSITE_ADVERTISING_CHANNEL_DETAILS:
        var AdvertisingChannel = settings.arguments as CompositeAdvertisingChannel;
        return MaterialPageRoute(builder: (_) => CompositeAdvertisingChannelDetails(AdvertisingChannel));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}