import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/core/view_models/BillboardPageBottomSheetViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/Billboard.dart';
import 'package:iad_advertiser/model/ReservationUnit.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class BottomSheetWidget extends StatefulWidget {
  AdvertisingChannel billboard;

  BottomSheetWidget(this.billboard);

  @override
  State<StatefulWidget> createState() => _BottomSheetState(billboard);
}

class _BottomSheetState extends State<BottomSheetWidget> {
  String startDateTimeString = 'choose start DateTime';
  String endDateTimeString = 'choose end DateTime';
  static const int startDateTimeIndex = 1;
  static const int endDateTimeIndex = 2;
  AdTimeInterval adTimeInterval;
  Billboard billboard;

  bool checkButtonPressed = false;
  bool areValidDates = true;

  _BottomSheetState(this.billboard){
    adTimeInterval = AdTimeInterval.withoutInit();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BillboardPageBottomSheetViewModel>(
      onModelReady: null,
      builder: (BuildContext context,
              BillboardPageBottomSheetViewModel viewModel, Widget child) =>
          Container(
            height: MediaQuery.of(context).size.height * 0.38,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                color: Colors.white),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildChooseDateFlatButton(
                      context, startDateTimeString, startDateTimeIndex),
                  buildChooseDateFlatButton(
                      context, endDateTimeString, endDateTimeIndex),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: viewModel.state == ViewState.IDLE
                        ? checkButtonPressed
                            ? viewModel.isBillboardAvailable
                                ? buildAvailabilityStatus(
                                    viewModel.isBillboardAvailable,
                                    Icons.verified_user,
                                    "Billboard Is Available\n Press again to confirm Reservation",
                                    AppColors.green)
                                : buildAvailabilityStatus(
                                    viewModel.isBillboardAvailable,
                                    Icons.cancel,
                                    "Sorry, Billboard Is not Available",
                                    AppColors.red)
                            : buildCheckWidget(viewModel)
                        : CircularProgressIndicator(),
                  ),
                ]),
          ),
    );
  }

  Widget buildCheckWidget(BillboardPageBottomSheetViewModel viewModel) {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: AppColors.appThemeColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: () {
            checkButtonPressed = true;
            if (checkDatesAreValid()) {
              viewModel.checkIsAvailableAdvertisingUnit(
                  billboard.id, adTimeInterval);
            } else
              setState(() {
                areValidDates = false;
                checkButtonPressed = false;
              });
          },
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
            child: Center(
                child: Text(
              "Check",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300),
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: areValidDates
              ? Container()
              : Text(
                  "Not Valid Dates",
                  style: TextStyle(
                      color: AppColors.red, fontWeight: FontWeight.w200),
                ),
        )
      ],
    );
  }

  Widget buildAvailabilityStatus(
      bool available, IconData icon, String txt, Color color) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        InkWell(
          onTap: () {
            if (available) {
              print("reserved");
              AdvertisingUnitsHandler advertisingUnitsHandler =
                  locator<AdvertisingUnitsHandler>();
              advertisingUnitsHandler.addToAdvertisingUnitIfPresentOrCreateOne(
                  BillboardReservationUnit(
                      billboard, adTimeInterval));

              Navigator.pop(context);
            }
          },
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(color: color, fontWeight: FontWeight.w200),
          ),
        )
      ],
    );
  }

  FlatButton buildChooseDateFlatButton(
      BuildContext context, String dateTimeString, int dateTimeIndex) {
    return FlatButton(
        onPressed: () {
          showDateTimePicker(context, dateTimeIndex);
        },
        child: buildChooseDateTimeButton(dateTimeString));
  }

  void showDateTimePicker(BuildContext context, int dateTimeIndex) {
    DatePicker.showDateTimePicker(context, showTitleActions: true,
        onConfirm: (date) {
      setState(() {
        if (dateTimeIndex == startDateTimeIndex) {
          adTimeInterval.adStartingDateTime = date;
          startDateTimeString = "starts at: " + formatDateTimeToString(date);
        } else if (dateTimeIndex == endDateTimeIndex) {
          adTimeInterval.adEndingDateTime = date;
          endDateTimeString = "ends at: " + formatDateTimeToString(date);
        }
      });
    }, currentTime: DateTime.now());
  }

  String formatDateTimeToString(DateTime date) {
    return date.toString().split(".").first;
  }

  bool checkDatesAreValid() {
    bool isValid = (adTimeInterval.adStartingDateTime != null && adTimeInterval.adEndingDateTime != null) &&
        (adTimeInterval.adEndingDateTime.isAfter(adTimeInterval.adStartingDateTime) && adTimeInterval.adEndingDateTime.hour>adTimeInterval.adStartingDateTime.hour);
    return isValid;
  }

  Widget buildChooseDateTimeButton(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //decoration: BoxDecoration(color:Color(0xFFE23A7E) ,borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.calendar_today,
                  color: AppColors.appThemeColor,
                ),
              ),
              Text(
                txt,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
