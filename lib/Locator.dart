import 'package:get_it/get_it.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/core/AuthenticationService.dart';
import 'package:iad_advertiser/core/MockAdvertisingPlatform.dart';
import 'package:iad_advertiser/core/PaymentService.dart';
import 'package:iad_advertiser/core/view_models/BillboardPageBottomSheetViewModel.dart';
import 'package:iad_advertiser/core/view_models/CheckoutAdvertisingUnitsViewModel.dart';
import 'package:iad_advertiser/core/view_models/CompositeAdvertisingChannelDetailsViewModel.dart';
import 'package:iad_advertiser/core/view_models/HomePageViewModel.dart';
import 'package:iad_advertiser/core/view_models/LoginViewModel.dart';
import 'package:iad_advertiser/core/view_models/WalletPageViewModel.dart';
import 'package:iad_advertiser/firebase/FirebaseAdvertisingPlatform.dart';
import 'package:iad_advertiser/firebase/FirebaseAuthenticationService.dart';

  GetIt locator = GetIt();

  void setup(){
    locator.registerLazySingleton<AdvertisingPlatform>(()=>FirebaseAdvertisingPlatform());
    locator.registerLazySingleton<AdvertisingUnitsHandler>(()=>AdvertisingUnitsHandler());
    locator.registerLazySingleton<PaymentService>(()=>PaymentService());
    locator.registerLazySingleton<AuthenticationService>(()=>FirebaseAuthenticationService());

    locator.registerFactory(()=>HomePageViewModel());
    locator.registerFactory(()=>CompositeAdvertisingChannelDetailsViewModel());
    locator.registerFactory(()=>BillboardPageBottomSheetViewModel());
    locator.registerFactory(()=>CheckOutAdvertisingUnitsViewModel());
    locator.registerFactory(()=>WalletPageViewModel());
    locator.registerFactory(()=>LoginViewModel());
  }