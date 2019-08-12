import 'package:flutter/material.dart';
import 'package:iad_advertiser/ui_utils/AdvertisingChannelTypeMapperToIcon.dart';

import 'package:iad_advertiser/model/AdvertisingChannel.dart';

class HomePage extends StatelessWidget {
  List<AdvertisingChannel> entitiesToAdvertiseAt;

  HomePage(this.entitiesToAdvertiseAt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text("Home",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w300))),
        elevation: 1.0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: entitiesToAdvertiseAt.length,
            itemBuilder: (context, index) {
              return Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: <Widget>[
                    entitiesToAdvertiseAt[index]
                        .getImageForThisAdvertisingChannel(),
                    Container(
                      color: Colors.cyan,
                      child: ListTile(
                        leading: Icon(
                          AdvertisingChannelTypeMapperToIcon.map(
                              entitiesToAdvertiseAt[index].type),
                          color: Colors.white,
                        ),
                        title: Text(
                          entitiesToAdvertiseAt[index].name,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        subtitle: Text(entitiesToAdvertiseAt[index].qoute,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              );
            }),
      ),
    );
  }
}
