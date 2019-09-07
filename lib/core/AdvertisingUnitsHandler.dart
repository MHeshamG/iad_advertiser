import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iad_advertiser/core/view_models/CheckoutAdvertisingUnitsViewModel.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/model/ReservationUnit.dart';

class AdvertisingUnitsHandler {
  List<AdvertisingUnit> _unProceededAdvertisingUnits;
  List<AdvertisingUnitsHandlerListener> _listeners;

  AdvertisingUnitsHandler() {
    print("created");
    _unProceededAdvertisingUnits = [];
    _listeners = [];
  }

  void addListener(AdvertisingUnitsHandlerListener listener){
    _listeners.add(listener);
  }

  void addToAdvertisingUnitIfPresentOrCreateOne(
      BillboardReservationUnit reservationUnit) {
    AdvertisingUnit advertisingUnitWithTheSameReservationDates;

    advertisingUnitWithTheSameReservationDates = _unProceededAdvertisingUnits.firstWhere(
        (advertisingUnit) =>
            advertisingUnit.adTimeInterval == reservationUnit.adTimeInterval,
        orElse: () => null);

    if (advertisingUnitWithTheSameReservationDates == null) {
      advertisingUnitWithTheSameReservationDates =
          AdvertisingUnit(reservationUnit.adTimeInterval);
      _unProceededAdvertisingUnits.add(advertisingUnitWithTheSameReservationDates);
      notifyListeners();
    }

    if (!advertisingUnitWithTheSameReservationDates.advertisingChannels
        .contains(reservationUnit.billboard)) {
      advertisingUnitWithTheSameReservationDates.advertisingChannels
          .add(reservationUnit.billboard);
      notifyListeners();
    }

    _unProceededAdvertisingUnits.forEach((adUnit) {
      print(adUnit.toString());
    });
  }

  void removeAdvertisingUnitFromCheckout(AdvertisingUnit advertisingUnit) {
    if (_unProceededAdvertisingUnits.contains(advertisingUnit))
      _unProceededAdvertisingUnits.remove(advertisingUnit);
    notifyListeners();
  }

  bool isBillboardReserved(String billboardId, AdTimeInterval adTimeInterval) {
    return _unProceededAdvertisingUnits.firstWhere(
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

  List<AdvertisingUnit> get unProceededAdvertisingUnits => _unProceededAdvertisingUnits;

  void notifyListeners() {
    for (final listener in _listeners) listener.onAdvertisingUnitsChanged();
  }

  void removeListener(AdvertisingUnitsHandlerListener listener) {
    if(_listeners.contains(listener))
      _listeners.remove(listener);
  }
}

abstract class AdvertisingUnitsHandlerListener {
  void onAdvertisingUnitsChanged();
}
