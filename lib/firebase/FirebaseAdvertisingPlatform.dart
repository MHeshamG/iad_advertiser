import 'package:iad_advertiser/core/AdvertisingPlatform.dart';
import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:iad_advertiser/model/Billboard.dart';
import 'package:iad_advertiser/model/CompositeAdvertisingChannel.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdvertisingPlatform extends AdvertisingPlatform{

  Firestore firestoreReference;

  FirebaseAdvertisingPlatform(){
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
      snapshot.documents.forEach((doc) { print(doc.data); advertisingPlaces.add(CompositeAdvertisingChannel.fromJson(doc.documentID,doc.data));});
    });
    return advertisingPlaces;
  }

  @override
  Future<List<AdvertisingChannel>> fetchBillboardsAtAdvertisingPlace(String placeId) async {
    List<AdvertisingChannel> billboards = [];
    await firestoreReference
        .collection("Billboards")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      List<DocumentSnapshot> billboardsDocumentsAtThisPlace = snapshot.documents.where((doc)=>doc["place_id"] == placeId).toList();
      billboardsDocumentsAtThisPlace.forEach((doc)=>billboards.add(Billboard.fromJson(doc.documentID, doc.data)));
    });
    return billboards;
  }

  @override
  Future<bool> isBillboardAvailable(String billboardId, AdTimeInterval adtimeInterval) {
    return null;
  }

  @override
  Future<void> reserveAdvertisingChannel(AdvertisingUnit advertisingUnit) {
    return null;
  }


}