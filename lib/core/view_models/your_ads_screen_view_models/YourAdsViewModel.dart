import '../../../model/AdvertisingUnit.dart';
import '../../../model/User.dart';
import '../BaseViewModel.dart';

abstract class YourAdsViewModel extends BaseViewModel {
   List<AdvertisingUnit> ads;
   void loadAds(User currentAuthorizedUser);
}