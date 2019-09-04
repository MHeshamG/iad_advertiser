
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';
import 'package:iad_advertiser/model/mappers/AdvertisingChannelTagMapper.dart';
import 'package:iad_advertiser/model/mappers/AdvertisingChannelTypeMapper.dart';

class Billboard extends AdvertisingChannel{
  String placeId;

  Billboard(String id, String name, String imageSrc, String description, AdvertisingChannelType type, int numberOfAds) : super(id, name, imageSrc, description, type,numberOfAds);
  Billboard.withCost(String id, String name, String imageSrc, String description, AdvertisingChannelType type,AdvertisingChannelTag tag,double cost,int views,int numOfAds) : super.withCost(id, name, imageSrc, description, type, tag, cost,views, numOfAds);

  Billboard.fromJson(String documentID, Map<String, dynamic> document):super.withCost(documentID, document["name"], document["image"],document["description"],AdvertisingChannelTypeMapper.mapFromString(document["type"]),AdvertisingChannelTagMapper.mapFromString(document["tag"]),double.parse(document["cost"]),int.parse(document["views"]),int.parse(document["number_of_ads"])) {
    placeId = document["place_id"];
  }

}