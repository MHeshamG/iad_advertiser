import 'dart:io';

import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';


class PaymentBottomSheetViewModel extends BaseViewModel {
  AdvertisingPlatform advertisingPlatform = locator<AdvertisingPlatform>();

  void payAndReserve(AdvertisingUnit adUnit,String userId) async {
    setState(ViewState.BUSY);
    await advertisingPlatform.reserveAdvertisingChannel(adUnit,userId);
    setState(ViewState.IDLE);
    removeAdvertisingUnitFromTheCheckoutList(adUnit);
  }

  void removeAdvertisingUnitFromTheCheckoutList(AdvertisingUnit adUnit) {
    locator<AdvertisingUnitsHandler>().removeAdvertisingUnitFromCheckout(adUnit);
  }
}
