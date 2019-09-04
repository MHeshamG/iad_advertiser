import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/model/ReservationUnit.dart';

class AdvertisingUnitsHandler {
  List<AdvertisingUnit> _advertisingUnits;

  AdvertisingUnitsHandler() {
    print("created");
    _advertisingUnits = [];
  }

  void addToAdvertisingUnitIfPresentOrCreateOne(
      BillboardReservationUnit reservationUnit) {
    AdvertisingUnit advertisingUnitWithTheSameReservationDates;

    advertisingUnitWithTheSameReservationDates = _advertisingUnits.firstWhere(
        (advertisingUnit) =>
            advertisingUnit.adTimeInterval == reservationUnit.adTimeInterval,
        orElse: () => null);

    if (advertisingUnitWithTheSameReservationDates == null) {
      advertisingUnitWithTheSameReservationDates =
          AdvertisingUnit(reservationUnit.adTimeInterval);
      _advertisingUnits.add(advertisingUnitWithTheSameReservationDates);
    }

    if (!advertisingUnitWithTheSameReservationDates.advertisingChannels
        .contains(reservationUnit.billboard))
      advertisingUnitWithTheSameReservationDates.advertisingChannels
          .add(reservationUnit.billboard);

    _advertisingUnits.forEach((adUnit) {
      print(adUnit.toString());
    });
  }

  bool isBillboardReserved(String billboardId, AdTimeInterval adTimeInterval) {
    return _advertisingUnits.firstWhere(
                (advertisingUnit) =>
                    (advertisingUnit.adTimeInterval == adTimeInterval ||
                        advertisingUnit.adTimeInterval
                            .overlapsWith(adTimeInterval)) &&
                    advertisingUnit.advertisingChannels.any(
                        (advertisingChannel) =>
                            advertisingChannel.id == billboardId),
                orElse: () => null) !=
            null
        ? true
        : false;
  }

  List<AdvertisingUnit> getAdvertisingUnits()=>_advertisingUnits;
}
