import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/core/view_models/CheckoutAdvertisingUnitsViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/widgets/AdvertisingUnitsListItem.dart';
import 'package:iad_advertiser/ui/widgets/PaymentBottomSheet.dart';
import 'package:iad_advertiser/ui/ui_utils/AdUnitsImagesLoader.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class CheckOutAdvertisingUnitsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckOutAdvertisingUnitsPageState();
}

class CheckOutAdvertisingUnitsPageState
    extends State<CheckOutAdvertisingUnitsPage> {
  AdUnitsImagesLoader adUnitsImageLoader;
  CheckOutAdvertisingUnitsViewModel _viewModel;

  CheckOutAdvertisingUnitsPageState() {
    adUnitsImageLoader = AdUnitsImagesLoader();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CheckOutAdvertisingUnitsViewModel>(
      onModelReady: (checkOutAdvertisingUnitsViewModel) {
        checkOutAdvertisingUnitsViewModel.loadAdvertisingUnits();
      },
      builder: (BuildContext context,
              CheckOutAdvertisingUnitsViewModel viewModel, Widget child) =>
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text("CheckOut",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300)),
              elevation: 1.0,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: viewModel.state == ViewState.IDLE
                  ? viewModel.advertisingUnits.length == 0
                      ? buildNoAdvertisingUnitsView()
                      : buildAdvertisingUnitsListView(
                          viewModel.advertisingUnits)
                  : CircularProgressIndicator(),
            ),
          ),
    );
  }

  Widget buildAdvertisingUnitsListView(List<AdvertisingUnit> advertisingUnits) {
    return ListView.builder(
      itemCount: advertisingUnits.length,
      itemBuilder: (buildContext, index) => AdvertisingUnitsListItem(
            advertisingUnits[index],
            operationsButtonsWidget:
                buildOperationsButtonsWidget(advertisingUnits[index]),
          ),
    );
  }

  Widget buildNoAdvertisingUnitsView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            FontAwesomeIcons.ad,
            color: AppColors.pink,
            size: 48.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("Start Reserving Billboards Now",
              style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.pink,
                  fontWeight: FontWeight.w300)),
        )
      ],
    );
  }

  Widget buildOperationsButtonsWidget(AdvertisingUnit adUnit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        buildIconButton(() async {
          adUnit.ad.imageFilePath =
              await loadImageForThisAdvertisingUnit(adUnit);
        }, Icons.camera_alt, AppColors.purple),
        buildIconButton(() {
          _viewModel.deleteAdvertisingUnit(adUnit);
        }, Icons.delete, AppColors.red),
        buildButton(() async {
          if (await adUnitsImageLoader.doesThisAdUnitHasAnAdImage(adUnit)) {
            showModalBottomSheet(
                context: context,
                builder: (buildContext) => PaymentBottomSheet(adUnit));
          }
        }, "Proceed", AppColors.green),
      ],
    );
  }

  Widget buildIconButton(Function ontap, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
        ),
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

  Future<String> loadImageForThisAdvertisingUnit(AdvertisingUnit adUnit) async {
    String imagePath = await adUnitsImageLoader
        .loadImageForThisAdvertisingUnit(adUnit, (image) {
      showDialog(
          context: context,
          builder: (context) => buildImageDialog(image, adUnit));
    });
    return imagePath;
  }

  Dialog buildImageDialog(image, adUnit) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: 100,
        height: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: 280.0,
                height: 7.0,
                decoration: BoxDecoration(
                    color: AppColors.appThemeColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
              child: Container(
                width: 225,
                height: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: Image.file(image).image),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                adUnitsImageLoader.requestImageChangeForAdvertisingUnit(adUnit);
              },
              color: AppColors.appThemeColor,
              child: Text(
                "Change Ad Image",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      ),
    );
  }
}
