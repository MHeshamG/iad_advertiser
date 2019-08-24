import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';

class CheckOutAdvertisingUnitsViewModel extends BaseViewModel{
  List<AdvertisingUnit> advertisingUnits;

  void loadAdvertisingUnits(){
    AdvertisingUnitsHandler advertisingUnitsHandler = locator<AdvertisingUnitsHandler>();
    setState(ViewState.BUSY);
    advertisingUnits = advertisingUnitsHandler.getAdvertisingUnits();
    setState(ViewState.IDLE);
  }

  void deleteAdvertisingUnit(AdvertisingUnit advertisingUnit) {
    setState(ViewState.BUSY);
    if(advertisingUnits.contains(advertisingUnit)){
      advertisingUnits.remove(advertisingUnit);
    }
    setState(ViewState.IDLE);
  }
}