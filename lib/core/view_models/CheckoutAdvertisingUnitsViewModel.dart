import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';

class CheckOutAdvertisingUnitsViewModel extends BaseViewModel
    implements AdvertisingUnitsHandlerListener {

  AdvertisingUnitsHandler advertisingUnitsHandler =
      locator<AdvertisingUnitsHandler>();
  List<AdvertisingUnit> advertisingUnits;

  CheckOutAdvertisingUnitsViewModel(){
    advertisingUnitsHandler.addListener(this);
  }

  void loadAdvertisingUnits() {
    setState(ViewState.BUSY);
    advertisingUnits = advertisingUnitsHandler.unProceededAdvertisingUnits;
    setState(ViewState.IDLE);
  }

  void deleteAdvertisingUnit(AdvertisingUnit advertisingUnit) {
    setState(ViewState.BUSY);
    if (advertisingUnits.contains(advertisingUnit)) {
      advertisingUnits.remove(advertisingUnit);
    }
    setState(ViewState.IDLE);
  }

  @override
  void onAdvertisingUnitsChanged() {
    setState(ViewState.BUSY);
    advertisingUnits = advertisingUnitsHandler.unProceededAdvertisingUnits;
    setState(ViewState.IDLE);
  }

  @override
  void dispose() {
    advertisingUnitsHandler.removeListener(this);
    super.dispose();
  }


}
