import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';

class BillboardPageBottomSheetViewModel extends BaseViewModel{
  AdvertisingPlatform advertisingPlatform = locator<AdvertisingPlatform>();
  bool isBillboardAvailable = false;

  void checkIsAvailableAdvertisingUnit(int billboardId,DateTime adStartDateTime,DateTime adEndDateTime) async{
    setState(ViewState.BUSY);
    isBillboardAvailable = await advertisingPlatform.checkBillboardAvailability(billboardId, adStartDateTime, adEndDateTime);
    setState(ViewState.IDLE);
  }
}