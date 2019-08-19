import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTagMapperToIcon.dart';
import 'package:iad_advertiser/ui/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';

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
                        height: 15.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            color: AdvertisingChannelTypeMapperToIcon.mapColor(
                                billboard.type)),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top:16.0,bottom: 8.0),
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
                            padding: EdgeInsets.only(left:16.0,right: 16.0),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.network(
                                  "https://www.phdmedia.com/north-america/wp-content/uploads/sites/11/2016/07/Marks-the-colder-it-gets-900x600.jpg"),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildInfoCard(
                                  context,
                                  Color(0xFFFC4264),
                                  Text(billboard.views.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w300)),
                                  "Views"),
                              buildInfoCard(
                                  context,
                                  Color(0xFF1FD7B6),
                                  Text(billboard.calculateCost().toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w300)),
                                  "EGP/Hour")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildInfoCard(
                                  context,
                                  Color(0xFF5A0074),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                        billboard.numberOfAds.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                  "Ads"),
                              buildInfoCard(
                                  context,
                                  Color(0xFF057AC0),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: AdvertisingChannelTagMapperToIcon
                                        .mapToIcon(billboard.tag),
                                  ),
                                  billboard.tag.toString().split(".").last),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed: () {
                                showDateTimeReservationDialog();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                  height: 50.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Center(
                                      child: Text(
                                    "Reserve",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w300),
                                  ))),
                              color:
                                  AdvertisingChannelTypeMapperToIcon.mapColor(
                                      billboard.type),
                            ),
                          ),
                        ],
                      ),
                      /* Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 15.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                color:
                                    AdvertisingChannelTypeMapperToIcon.mapColor(
                                        billboard.type)),
                          ),
                        ),
                      ),*/
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

  Padding buildInfoCard(
      BuildContext context, Color color, Widget num, String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width * (0.37),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            num,
            Text(txt,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }

  void showDateTimeReservationDialog() {}
}
