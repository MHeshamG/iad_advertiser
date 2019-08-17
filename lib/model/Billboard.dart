
import 'package:iad_advertiser/model/AdvertisingChannel.dart';
import 'package:iad_advertiser/model/AdvertisingChannelTag.dart';
import 'package:iad_advertiser/model/AdvertisingChannelType.dart';

class Billboard extends AdvertisingChannel{

  Billboard(String name, String imageSrc, String qoute, AdvertisingChannelType type) : super(name, imageSrc, qoute, type);
  Billboard.withTag(String name, String imageSrc, String qoute, AdvertisingChannelType type,AdvertisingChannelTag tag) : super.withTag(name, imageSrc, qoute, type, tag);

}