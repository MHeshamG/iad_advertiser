import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';

abstract class AdvertisingPlatform{
  Future<List<AdvertisingChannel>> fetchAdvertisingPlaces();
  Future<List<AdvertisingChannel>> fetchBillboardsAtAdvertisingPlace(int placeId);
  Future<bool> isBillboardAvailable(int billboardId, AdTimeInterval adtimeInterval);
  Future<void> reserveAdvertisingChannel(AdvertisingUnit advertisingUnit);
  Future<bool> cancelReservation(AdvertisingUnit advertisingUnit);
  Future<List<AdvertisingUnit>> fetchAdvertisingHistory(User user);
}