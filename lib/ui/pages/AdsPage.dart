import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/core/view_models/LiveAdsWidgetViewModel.dart';
import 'package:iad_advertiser/core/view_models/PreviousAdsWidgetViewModel.dart';
import 'package:iad_advertiser/core/view_models/UpComingAdsWidgetViewModel.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';
import 'package:iad_advertiser/ui/widgets/AdvertisingUnitsListItem.dart';
import 'package:iad_advertiser/ui/widgets/YourAdsWidget.dart';
import 'package:provider/provider.dart';

class AdsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AdsPageState();
}

class AdsPageState extends State<AdsPage> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Your Ads",
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: loadCurrentYourAdsWidget(_currentTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentTabIndex) {
          setState(() {
            _currentTabIndex = currentTabIndex;
          });
        },

        currentIndex: _currentTabIndex,
        backgroundColor: Colors.white,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.undo),
            title: new Text('Previous'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.clock),
            title: new Text('Live'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.redo), title: Text('Upcoming'))
        ],
      ),
    );
  }

  Widget buildAdvertisingUnitsListView(List<AdvertisingUnit> previousAds) {
    return ListView.builder(
        itemCount: previousAds.length,
        itemBuilder: (buildContext, index) =>
            AdvertisingUnitsListItem(previousAds[index]));
  }

  Widget loadCurrentYourAdsWidget(int currentTabIndex) {
    switch (_currentTabIndex) {
      case 0:
        return YourAdsWidget<PreviousAdsWidgetViewModel>(
            loadAds: (viewModel) {
              viewModel.loadPreviousAds(Provider.of<User>(context));
            },
            buildAdvertisingUnitsListView: (viewModel) =>
                viewModel.previousAds.isEmpty
                    ? buildNoAdsToShowView()
                    : buildAdvertisingUnitsListView(viewModel.previousAds));
      case 1:
        return YourAdsWidget<LiveAdsWidgetViewModel>(
            loadAds: (viewModel) {
              viewModel.loadPreviousAds(Provider.of<User>(context));
            },
            buildAdvertisingUnitsListView: (viewModel) =>
                viewModel.liveAds.isEmpty
                    ? buildNoAdsToShowView()
                    : buildAdvertisingUnitsListView(viewModel.liveAds));

      case 2:
        return YourAdsWidget<UpComingAdsWidgetViewModel>(
            loadAds: (viewModel) {
              viewModel.loadUpComingAds(Provider.of<User>(context));
            },
            buildAdvertisingUnitsListView: (viewModel) =>
                viewModel.upComingAds.isEmpty
                    ? buildNoAdsToShowView()
                    : buildAdvertisingUnitsListView(viewModel.upComingAds));
    }
  }

  Widget buildNoAdsToShowView() {
    return Text(
      "No Ads to show",
      style: TextStyle(
          fontWeight: FontWeight.w300, fontSize: 18.0, color: AppColors.red),
    );
  }
}
