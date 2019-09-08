import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/view_models/AdsHistoryHandler.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';

class PreviousAdsWidgetViewModel extends BaseViewModel {
  AdsHistoryHandler _adsHistoryHandler = locator<AdsHistoryHandler>();
  List<AdvertisingUnit> previousAds;

  void loadPreviousAds(User currentAuthorizedUser) async {
    setState(ViewState.BUSY);
    previousAds =
        await _adsHistoryHandler.loadPreviousAds(currentAuthorizedUser);
    setState(ViewState.IDLE);
  }
}
