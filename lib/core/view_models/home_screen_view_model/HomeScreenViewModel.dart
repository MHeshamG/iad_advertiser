import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';

class HomePageViewModel extends BaseViewModel{
  AdvertisingPlatform advertisingPlatform = locator<AdvertisingPlatform>();
  List<AdvertisingChannel> placesToAdvertiseAt;

  void fetchPlacesToAdvertiseAt() async {
    setState(ViewState.BUSY);
    placesToAdvertiseAt = await advertisingPlatform.fetchAdvertisingPlaces();
    setState(ViewState.IDLE);
  }
}