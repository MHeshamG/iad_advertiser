import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/ui/widgets/BillboardPageBottomSheet.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTagMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class BillboardPage extends StatefulWidget {
  AdvertisingChannel billboard;

  BillboardPage(this.billboard);

  @override
  State<StatefulWidget> createState() => BillboardPageState(billboard);
}

class BillboardPageState extends State<BillboardPage> {
  AdvertisingChannel billboard;

  BillboardPageState(this.billboard);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Billboard",
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 32.0, bottom: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 8.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            color: AdvertisingChannelTypeMapperToIcon.mapColor(
                                billboard.type)),
                      ),
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 8.0),
                          child: Text(
                            billboard.name,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.network(
                                  billboard.imageSrc),
                            ),
                          ),
                          buildRowOfInfoCards(
                              buildInfoCard(
                                  context,
                                  Text(billboard.views.toString(),
                                      style: textStyle()),
                                  "Views"),
                              buildInfoCard(
                                  context,
                                  Text(billboard.calculateCost().toString(),
                                      style: textStyle()),
                                  "EGP/Hour")),
                          buildRowOfInfoCards(
                            buildInfoCard(
                                context,
                                Text(billboard.numberOfAds.toString(),
                                    style: textStyle()),
                                "Ads"),
                            buildInfoCard(
                                context,
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: AdvertisingChannelTagMapperToIcon
                                      .mapToIcon(billboard.tag),
                                ),
                                billboard.tag.toString().split(".").last),
                          ),
                          ReserveActionButton(billboard),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AdvertisingChannelTypeMapperToIcon.map(billboard.type),
                )),
          ],
        ),
      ),
    );
  }

  Widget buildRowOfInfoCards(Widget widget1, Widget widget2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[widget1, widget2],
    );
  }

  Widget buildInfoCard(BuildContext context, Widget num, String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width * (0.37),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: AppColors.appThemeColor, width: 2.0),
            ),
            boxShadow: [
              BoxShadow(blurRadius: 2, color: Colors.grey[300], spreadRadius: 1)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            num,
            Text(txt,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }

  textStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.w300);
  }
}

class ReserveActionButton extends StatelessWidget {
  AdvertisingChannel billboard;

  ReserveActionButton(this.billboard);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => BottomSheetWidget(billboard));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(
                child: Text(
              "Reserve",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300),
            ))),
        color: AppColors.appThemeColor,
      ),
    );
  }
}
