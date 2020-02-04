import 'package:flutter/material.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/core/view_models/your_ads_screen_view_models/YourAdsViewModel.dart';
import 'package:iad_advertiser/ui/BaseView.dart';

import '../../model/AdvertisingUnit.dart';
import '../ui_utils/AppColors.dart';
import 'AdvertisingUnitsListItem.dart';

class YourAdsWidget<T extends YourAdsViewModel> extends StatelessWidget {
  Function(T viewModel) loadAds;

  YourAdsWidget({this.loadAds});

  @override
  Widget build(BuildContext context) {
    return BaseView<T>(
      onModelReady: (T viewModel) {
        loadAds(viewModel);
      },
      builder: (BuildContext context, T viewModel, Widget child) => Container(
            color: Colors.white,
            child: Center(
              child: viewModel.state == ViewState.IDLE
                  ? buildAdvertisingUnitsListView(viewModel.ads)
                  : CircularProgressIndicator(),
            ),
          ),
    );
  }

  Widget buildAdvertisingUnitsView(List<AdvertisingUnit> adUnits){
    return adUnits.isEmpty ? buildNoAdsToShowView():buildAdvertisingUnitsListView;
  }

  Widget buildNoAdsToShowView() {
    return Text(
      "No Ads to show",
      style: TextStyle(
          fontWeight: FontWeight.w300, fontSize: 18.0, color: AppColors.red),
    );
  }

  Widget buildAdvertisingUnitsListView(List<AdvertisingUnit> ads) {
    return ListView.builder(
        itemCount: ads.length,
        itemBuilder: (buildContext, index) =>
            AdvertisingUnitsListItem(ads[index]));
  }
}
