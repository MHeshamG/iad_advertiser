import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/core/view_models/LiveAdsWidgetViewModel.dart';
import 'package:iad_advertiser/core/view_models/PreviousAdsWidgetViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/widgets/AdvertisingUnitsListItem.dart';
import 'package:iad_advertiser/ui/widgets/YourAdsWidget.dart';
import 'package:provider/provider.dart';

class AdsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AdsPageState();

}

class AdsPageState extends State<AdsPage> {
  int _currentTabIndex = 0;
  Widget yourAdsWidget ;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
        body: yourAdsWidget??YourAdsWidget<PreviousAdsWidgetViewModel>(loadAds: (viewModel) {
          viewModel.loadPreviousAds(Provider.of<User>(context));
        },
            buildAdvertisingUnitsListView: (viewModel) =>
                buildAdvertisingUnitsListView(viewModel.previousAds)),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (currentTabIndex) {
            setState(() {
              _currentTabIndex = currentTabIndex;
              switch (_currentTabIndex) {
                case 0:
                  yourAdsWidget = YourAdsWidget<PreviousAdsWidgetViewModel>(
                      loadAds: (viewModel) {
                        viewModel.loadPreviousAds(Provider.of<User>(context));
                      },
                      buildAdvertisingUnitsListView: (viewModel) =>
                          buildAdvertisingUnitsListView(viewModel.previousAds));
                  break;
                case 1:
                  yourAdsWidget = YourAdsWidget<LiveAdsWidgetViewModel>(
                      loadAds: (viewModel) {
                        viewModel.loadPreviousAds(Provider.of<User>(context));
                      },
                      buildAdvertisingUnitsListView: (viewModel) =>
                          buildAdvertisingUnitsListView(viewModel.liveAds));
                  break;
                case 2:
                  yourAdsWidget = YourAdsWidget<PreviousAdsWidgetViewModel>(
                      loadAds: (viewModel) {
                        viewModel.loadPreviousAds(Provider.of<User>(context));
                      },
                      buildAdvertisingUnitsListView: (viewModel) =>
                          buildAdvertisingUnitsListView(viewModel.previousAds));
                  break;
              }
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
}
