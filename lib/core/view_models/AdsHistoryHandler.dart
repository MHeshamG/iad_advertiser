import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';

class AdsHistoryHandler {
  AdvertisingPlatform _advertisingPlatform = locator<AdvertisingPlatform>();
  List<AdvertisingUnit> adsForThisUser;

  Future<List<AdvertisingUnit>> loadPreviousAds(
      User currentAuthorizedUser) async {
    List<AdvertisingUnit> previousAdsForThisUser = [];
    if (adsForThisUser == null) {
      adsForThisUser =
          await _advertisingPlatform.fetchAdsForThisUser(currentAuthorizedUser);
    }
    if (adsForThisUser != null)
      previousAdsForThisUser = adsForThisUser
          .where((adUnit) =>
              adUnit.adTimeInterval.adEndingDateTime.isBefore(DateTime.now()))
          .toList();
    return previousAdsForThisUser;
  }

  Future<List<AdvertisingUnit>> loadLiveAds(User currentAuthorizedUser) async {
    List<AdvertisingUnit> liveAdsForThisUser = [];
    if (adsForThisUser == null) {
      adsForThisUser =
          await _advertisingPlatform.fetchAdsForThisUser(currentAuthorizedUser);
    }
    if (adsForThisUser != null) {
      DateTime nowDateTime = DateTime.now();
      liveAdsForThisUser = adsForThisUser
          .where((adUnit) =>
              nowDateTime.isAfter(adUnit.adTimeInterval.adStartingDateTime) &&
              nowDateTime.isBefore(adUnit.adTimeInterval.adEndingDateTime))
          .toList();
    }
    return liveAdsForThisUser;
  }

  Future<List<AdvertisingUnit>> loadUpComingAds(
      User currentAuthorizedUser) async {
    List<AdvertisingUnit> upComingAdsForThisUser = [];
    if (adsForThisUser == null) {
      adsForThisUser =
          await _advertisingPlatform.fetchAdsForThisUser(currentAuthorizedUser);
    }
    if (adsForThisUser != null) {
      DateTime nowDateTime = DateTime.now();
      upComingAdsForThisUser = adsForThisUser
          .where((adUnit) =>
              adUnit.adTimeInterval.adStartingDateTime.isAfter(nowDateTime))
          .toList();
    }
    return upComingAdsForThisUser;
  }
}
