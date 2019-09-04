import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';

class BillboardPageBottomSheetViewModel extends BaseViewModel{
  AdvertisingPlatform advertisingPlatform = locator<AdvertisingPlatform>();
  bool isBillboardAvailable = false;

  void checkIsAvailableAdvertisingUnit(String billboardId, AdTimeInterval adTimeInterval) async{
    setState(ViewState.BUSY);
    isBillboardAvailable = await advertisingPlatform.isBillboardAvailable(billboardId, adTimeInterval);
    setState(ViewState.IDLE);
  }
}