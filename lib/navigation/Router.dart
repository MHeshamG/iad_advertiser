import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/Billboard.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/ui/pages/BillboardPage.dart';
import 'package:iad_advertiser/ui/pages/CheckOutAdvertisingUnitsPage.dart';
import 'package:iad_advertiser/ui/pages/AdvertisingPlaceDetailsPage.dart';
import 'package:iad_advertiser/ui/pages/HomePage.dart';
import 'package:iad_advertiser/ui/pages/LoginPage.dart';
import 'package:iad_advertiser/ui/pages/SignUpPage.dart';
import 'package:iad_advertiser/ui/pages/WalletPage.dart';

import 'Routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.SIGNUP:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case Routes.HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.COMPOSITE_ADVERTISING_CHANNEL_DETAILS:
        var AdvertisingChannel = settings.arguments as CompositeAdvertisingChannel;
        return MaterialPageRoute(builder: (_) => AdvertisingPlaceDetailsPage(AdvertisingChannel));
      case Routes.BILLBOARD_PAGE:
        var AdvertisingChannel = settings.arguments as Billboard;
        return MaterialPageRoute(builder: (_) => BillboardPage(AdvertisingChannel));
      case Routes.CHECKOUT_PAGE:
        return MaterialPageRoute(builder: (_) => CheckOutAdvertisingUnitsPage());
      case Routes.Wallet_PAGE:
        return MaterialPageRoute(builder: (_) => WalletPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}