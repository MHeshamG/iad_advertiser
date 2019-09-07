import 'dart:io';

import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AdImageUploader.dart';
import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/core/AdvertisingUnitsHandler.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/Billboard.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdvertisingPlatform extends AdvertisingPlatform {
  Firestore firestoreReference;

  FirebaseAdvertisingPlatform() {
    firestoreReference = Firestore.instance;
  }

  @override
  Future<bool> cancelReservation(AdvertisingUnit advertisingUnit) {
    return null;
  }

  @override
  Future<List<AdvertisingUnit>> fetchAdvertisingHistory(User user) {
    return null;
  }

  @override
  Future<List<AdvertisingChannel>> fetchAdvertisingPlaces() async {
    List<AdvertisingChannel> advertisingPlaces = [];
    await firestoreReference
        .collection("AdvertisingPlaces")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((doc) {
        print(doc.data);
        advertisingPlaces.add(
            CompositeAdvertisingChannel.fromJson(doc.documentID, doc.data));
      });
    });
    return advertisingPlaces;
  }

  @override
  Future<List<AdvertisingChannel>> fetchBillboardsAtAdvertisingPlace(
      String placeId) async {
    List<AdvertisingChannel> billboards = [];
    await firestoreReference
        .collection("Billboards")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      List<DocumentSnapshot> billboardsDocumentsAtThisPlace = snapshot.documents
          .where((doc) => doc["place_id"] == placeId)
          .toList();
      billboardsDocumentsAtThisPlace.forEach((doc) =>
          billboards.add(Billboard.fromJson(doc.documentID, doc.data)));
    });
    return billboards;
  }

  @override
  Future<bool> isBillboardAvailable(
      String billboardId, AdTimeInterval adTimeInterval) async {
    print(billboardId);
    bool isAvailable =
        checkLocalyIfBillboardReserved(billboardId, adTimeInterval);
    if (!isAvailable) return isAvailable;
    isAvailable =
        await checkThroughAdvertisingPlatformIfThisBillboardIsAvailable(
            billboardId, adTimeInterval);
    print("isAvailable: " + isAvailable.toString());
    return isAvailable;
  }

  Future<bool> checkThroughAdvertisingPlatformIfThisBillboardIsAvailable(
      String billboardId, AdTimeInterval adTimeInterval) async {
    bool isAvailable = true;
    QuerySnapshot snapshot = await firestoreReference
        .collection("AdUnits")
        .where("billboard_id", isEqualTo: billboardId)
        .getDocuments();
    for (final adUnitDoc in snapshot.documents) {
      DocumentSnapshot adDoc = await firestoreReference
          .collection("Ads")
          .document(adUnitDoc["ad_id"])
          .get();
      AdTimeInterval thisAdTimeInterval = AdTimeInterval(
          adDoc["start_datetime"].toDate(), adDoc["end_datetime"].toDate());
      print(thisAdTimeInterval.overlapsWith(adTimeInterval));
      if (thisAdTimeInterval.overlapsWith(adTimeInterval)) {
        isAvailable = false;
      }
    }
    return isAvailable;
  }

  bool checkLocalyIfBillboardReserved(
      String billboardId, AdTimeInterval adTimeInterval) {
    AdvertisingUnitsHandler advertisingUnitsHandler =
        locator<AdvertisingUnitsHandler>();
    return !advertisingUnitsHandler.isBillboardReserved(
        billboardId, adTimeInterval);
  }

  @override
  Future<bool> reserveAdvertisingChannel(
      AdvertisingUnit advertisingUnit,String userId) async {
    bool reserved = false;
    String adImageUrl = await locator<AdImageUploader>()
        .uploadImage(advertisingUnit.ad.imageFilePath, "name.jpg");
    Map<String, dynamic> adDataJson = advertisingUnit.getAdUnitInJsonFormat();
    adDataJson.putIfAbsent("ad_image_url", () => adImageUrl);
    adDataJson.putIfAbsent("user_id", () => userId);
    DocumentReference documentReference =
        await firestoreReference.collection("Ads").add(adDataJson);
    String adId = documentReference.documentID;
    if (adId != null && adId.isNotEmpty) {
      reserved = true;
      await AddBillbordsIdsWithAdIdInAdUnitsJoinTable(advertisingUnit, adId);
    }
    return reserved;
  }

  Future AddBillbordsIdsWithAdIdInAdUnitsJoinTable(AdvertisingUnit advertisingUnit, String adId) async {
    for (AdvertisingChannel billboard in advertisingUnit.advertisingChannels)
      await firestoreReference.collection("AdUnits").add({
        "ad_id": adId,
        "billboard_id": billboard.id
      });
  }
}
