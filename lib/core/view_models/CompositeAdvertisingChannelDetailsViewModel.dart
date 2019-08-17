import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';

class CompositeAdvertisingChannelDetailsViewModel extends BaseViewModel{
  AdvertisingPlatform advertisingPlatform = locator<AdvertisingPlatform>();
  List<AdvertisingChannel> billboardsAtThisPlace;

  void fetchBillboardsAtThisPlace(int placeId) async {
    setState(ViewState.BUSY);
    billboardsAtThisPlace = await advertisingPlatform.fetchBillboardsAtAdvertisingPlace(placeId);
    setState(ViewState.IDLE);
  }
}