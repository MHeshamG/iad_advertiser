import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class AdvertisingUnitsListItem extends StatelessWidget {
  AdvertisingUnit advertisingUnit;
  Widget operationsButtonsWidget;

  AdvertisingUnitsListItem(this.advertisingUnit,
      {this.operationsButtonsWidget});

  @override
  Widget build(BuildContext context) =>
      buildAdvertisingUnitListItem(advertisingUnit, operationsButtonsWidget);

  Widget buildAdvertisingUnitListItem(
      AdvertisingUnit advertisingUnit, Widget operationsButtonsWidget) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildLeftSideColoredBorder(),
            buildNumberOfBillboardsWidget(
                advertisingUnit.getNumberOfBillboards()),
            buildVerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildAdTimeIntervalInfoWidget(advertisingUnit),
                      buildTotalCostWidget(advertisingUnit.cost),
                    ],
                  ),
                ),
                operationsButtonsWidget??Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTotalCostWidget(double totalCost) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            totalCost.toString(),
            style: TextStyle(
                color: AppColors.appThemeColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w300),
          ),
          Text(
            "EGP",
            style: TextStyle(
                color: AppColors.appThemeColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  Widget buildAdTimeIntervalInfoWidget(AdvertisingUnit adUnit) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          buildDateTimeInfoWidget(adUnit.getAdTimeIntervalStarting()),
          buildDateTimeInfoWidget(adUnit.getAdTimeIntervalEnding())
        ],
      ),
    );
  }

  Widget buildDateTimeInfoWidget(String dateTimeString) {
    String date = dateTimeString.split(" ").first;
    String time = dateTimeString.split(" ").last;
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            date,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
        ),
        Container(
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: AppColors.pink,
          ),
          child: Text(time,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
        )
      ],
    );
  }

  Container buildVerticalDivider() {
    return Container(
        height: 80, child: VerticalDivider(color: AppColors.appThemeColor));
  }

  Widget buildNumberOfBillboardsWidget(int numberOfBillboards) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            numberOfBillboards.toString(),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300),
          ),
          Text(
            "Billboards",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  Container buildLeftSideColoredBorder() {
    return Container(
      width: 6.0,
      height: 120.0,
      decoration: BoxDecoration(
        color: AppColors.appThemeColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
      ),
    );
  }
}
