import 'package:flutter/material.dart';

import 'package:iad_advertiser/model/AdvertisingChannelType.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/ui/HomePage.dart';

import 'navigation/Router.dart';

void main() => runApp(MyApp());
CompositeAdvertisingChannel mallOfArabia = CompositeAdvertisingChannel(
    "Mall Of Arabia",
    "https://images.unsplash.com/photo-1518296968927-03cb25efaa54?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
    "Second Biggest Mall In Egypt",
    AdvertisingChannelType.Mall);

List<CompositeAdvertisingChannel> entities = [
  mallOfArabia,
  CompositeAdvertisingChannel(
      "Festival Mall",
      "https://images.unsplash.com/photo-1519567241046-7f570eee3ce6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1216&q=80",
      "New Cairo Mall",
      AdvertisingChannelType.Mall),
  CompositeAdvertisingChannel(
      "Mall Of Egypt",
      "https://images.unsplash.com/photo-1533481405265-e9ce0c044abb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80",
      "Biggest Mall In Egypt",
      AdvertisingChannelType.Mall),
  CompositeAdvertisingChannel(
      "Cairo Airport",
      "https://images.unsplash.com/photo-1543159821-9161ad7d5682?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80",
      "Capital Airport",
      AdvertisingChannelType.Airport)
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(entities),
    );
  }
}

