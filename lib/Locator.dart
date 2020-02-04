import 'package:get_it/get_it.dart';
import 'package:iad_advertiser/core/AdImageUploader.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/core/AuthenticationService.dart';
import 'package:iad_advertiser/core/view_models/AdsHistoryHandler.dart';
import 'package:iad_advertiser/core/view_models/your_ads_screen_view_models/LiveAdsWidgetViewModel.dart';
import 'package:iad_advertiser/core/view_models/your_ads_screen_view_models/PreviousAdsWidgetViewModel.dart';
import 'package:iad_advertiser/core/view_models/SignUpScreenViewModel.dart';
import 'package:iad_advertiser/core/view_models/your_ads_screen_view_models/UpComingAdsWidgetViewModel.dart';
import 'package:iad_advertiser/firebase/storage/FirestorageAdImageUploader.dart';
import 'package:iad_advertiser/core/PaymentService.dart';
import 'package:iad_advertiser/core/view_models/BillboardPageBottomSheetViewModel.dart';
import 'package:iad_advertiser/core/view_models/CheckoutAdvertisingUnitsViewModel.dart';
import 'package:iad_advertiser/core/view_models/CompositeAdvertisingChannelDetailsViewModel.dart';
import 'package:iad_advertiser/core/view_models/home_screen_view_model/HomeScreenViewModel.dart';
import 'package:iad_advertiser/core/view_models/login_screen_view_models/LoginViewModel.dart';
import 'package:iad_advertiser/core/view_models/PaymentBottomSheetViewModel.dart';
import 'package:iad_advertiser/core/view_models/WalletScreenViewModel.dart';
import 'package:iad_advertiser/firebase/FirebaseAdvertisingPlatform.dart';
import 'package:iad_advertiser/firebase/authentication/FirebaseAuthenticationService.dart';

  GetIt locator = GetIt();

  void setup(){
    locator.registerLazySingleton<AdvertisingPlatform>(()=>FirebaseAdvertisingPlatform());
    locator.registerLazySingleton<AdvertisingUnitsHandler>(()=>AdvertisingUnitsHandler());
    locator.registerLazySingleton<PaymentService>(()=>PaymentService());
    locator.registerLazySingleton<AuthenticationService>(()=>FirebaseAuthenticationService());
    locator.registerLazySingleton<AdImageUploader>(()=>FirestorageAdImageUploader());
    locator.registerLazySingleton<AdsHistoryHandler>(()=>AdsHistoryHandler());


    locator.registerFactory(()=>HomePageViewModel());
    locator.registerFactory(()=>CompositeAdvertisingChannelDetailsViewModel());
    locator.registerFactory(()=>BillboardPageBottomSheetViewModel());
    locator.registerFactory(()=>CheckOutAdvertisingUnitsViewModel());
    locator.registerFactory(()=>WalletPageViewModel());
    locator.registerFactory(()=>LoginViewModel());
    locator.registerFactory(()=>SignUpPageViewModel());
    locator.registerFactory(()=>PaymentBottomSheetViewModel());
    locator.registerFactory(()=>PreviousAdsWidgetViewModel());
    locator.registerFactory(()=>LiveAdsWidgetViewModel());
    locator.registerFactory(()=>UpComingAdsWidgetViewModel());
  }