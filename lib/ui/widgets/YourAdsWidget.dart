import 'package:flutter/material.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/ui/BaseView.dart';

class YourAdsWidget<T extends BaseViewModel> extends StatelessWidget {
  Function(T viewModel) loadAds;
  Function(T viewModel) buildAdvertisingUnitsListView;

  YourAdsWidget({this.loadAds, this.buildAdvertisingUnitsListView});

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
                  ? buildAdvertisingUnitsListView(viewModel)
                  : CircularProgressIndicator(),
            ),
          ),
    );
  }
}
