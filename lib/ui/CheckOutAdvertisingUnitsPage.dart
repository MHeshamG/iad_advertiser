import 'package:flutter/material.dart';
import 'package:iad_advertiser/core/view_models/CheckoutAdvertisingUnitsViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class CheckOutAdvertisingUnitsPage extends StatelessWidget {
  CheckOutAdvertisingUnitsViewModel checkOutAdvertisingUnitsViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<CheckOutAdvertisingUnitsViewModel>(
      onModelReady: (checkOutAdvertisingUnitsViewModel) {
        this.checkOutAdvertisingUnitsViewModel =
            checkOutAdvertisingUnitsViewModel;
        checkOutAdvertisingUnitsViewModel.loadAdvertisingUnits();
      },
      builder: (BuildContext context,
              CheckOutAdvertisingUnitsViewModel viewModel, Widget child) =>
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text("CheckOut",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300)),
              elevation: 1.0,
            ),
            body: Container(
                color: Colors.white,
                child: viewModel.state == ViewState.IDLE
                    ? ListView.builder(
                        itemCount: viewModel.advertisingUnits.length,
                        itemBuilder: (buildContext, index) => Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 6.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        color: AppColors.appThemeColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            bottomLeft: Radius.circular(8.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            viewModel.advertisingUnits[index]
                                                .getNumberOfBillboards()
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Text(
                                            "Billboards",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        height: 80,
                                        child: VerticalDivider(
                                            color: AppColors.appThemeColor)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        viewModel
                                                            .advertisingUnits[
                                                                index]
                                                            .getAdTimeIntervalStarting(),
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        viewModel
                                                            .advertisingUnits[
                                                                index]
                                                            .getAdTimeIntervalEnding(),
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      viewModel
                                                          .advertisingUnits[
                                                              index]
                                                          .calculateTotalCost()
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .appThemeColor,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    Text(
                                                      "EGP",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .appThemeColor,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            buildButton(() {
                                              viewModel.deleteAdvertisingUnit(
                                                  viewModel
                                                      .advertisingUnits[index]);
                                            }, "Delete", AppColors.red),
                                            buildButton(() {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      BottomSheetWidget());
                                            }, "Proceed", AppColors.green),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                    : CircularProgressIndicator()),
          ),
    );
  }

  FlatButton buildButton(Function onPressed, String txt, Color color) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(fontWeight: FontWeight.w300, color: color),
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Icon(Icons.file_upload,color: AppColors.appThemeColor,size: 40.0,),
            ),
            RaisedButton(
              onPressed: (){},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              color: AppColors.appThemeColor,
              child: Text("Choose Image",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
            )
          ],
        ),
      ),
    );
  }
}
