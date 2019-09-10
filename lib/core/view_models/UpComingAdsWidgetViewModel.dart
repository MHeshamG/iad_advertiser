import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/view_models/AdsHistoryHandler.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';

class UpComingAdsWidgetViewModel extends BaseViewModel {
  AdsHistoryHandler _adsHistoryHandler = locator<AdsHistoryHandler>();
  List<AdvertisingUnit> upComingAds;

  void loadUpComingAds(User currentAuthorizedUser) async {
    setState(ViewState.BUSY);
    upComingAds = await _adsHistoryHandler.loadUpComingAds(currentAuthorizedUser);
    setState(ViewState.IDLE);
  }
}
