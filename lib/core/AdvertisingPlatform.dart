import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';

abstract class AdvertisingPlatform{
  Future<List<AdvertisingChannel>> fetchAdvertisingPlaces();
  Future<List<AdvertisingChannel>> fetchBillboardsAtAdvertisingPlace(String placeId);
  Future<bool> isBillboardAvailable(String billboardId, AdTimeInterval adtimeInterval);
  Future<bool> reserveAdvertisingChannel(AdvertisingUnit advertisingUnit,String userId);
  Future<bool> cancelReservation(AdvertisingUnit advertisingUnit);
  Future<List<AdvertisingUnit>> fetchAdsForThisUser(User user);

}