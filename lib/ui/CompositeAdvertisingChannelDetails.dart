import 'package:flutter/material.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';

class CompositeAdvertisingChannelDetails extends StatelessWidget {
  CompositeAdvertisingChannel advertisingChannel;

  CompositeAdvertisingChannelDetails(this.advertisingChannel);

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
          "Billboards",
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Text("count: ${advertisingChannel.advertisingBillboards.length}"),
      ),
    );
  }
}
