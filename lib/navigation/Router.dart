import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/Billboard.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/ui/BillboardPage.dart';
import 'package:iad_advertiser/ui/CheckOutAdvertisingUnitsPage.dart';
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
      case Routes.BILLBOARD_PAGE:
        var AdvertisingChannel = settings.arguments as Billboard;
        return MaterialPageRoute(builder: (_) => BillboardPage(AdvertisingChannel));
      case Routes.CHECKOUT_PAGE:
        return MaterialPageRoute(builder: (_) => CheckOutAdvertisingUnitsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}