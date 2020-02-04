import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/view_models/AdsHistoryHandler.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/core/view_models/your_ads_screen_view_models/YourAdsViewModel.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';

class LiveAdsWidgetViewModel extends YourAdsViewModel {
  AdsHistoryHandler _adsHistoryHandler = locator<AdsHistoryHandler>();

  @override
  void loadAds(User currentAuthorizedUser) async {
    setState(ViewState.BUSY);
    ads = await _adsHistoryHandler.loadLiveAds(currentAuthorizedUser);
    setState(ViewState.IDLE);
  }
}
