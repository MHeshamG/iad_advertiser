import 'dart:collection';
import 'dart:io';

import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';


class AdUnitsImagesLoader {
  Map<AdTimeInterval, File> advertisingUnitsAdsMap;

  AdUnitsImagesLoader() {
    advertisingUnitsAdsMap = HashMap();
  }

  Future<String> loadImageForThisAdvertisingUnit(AdvertisingUnit advertisingUnit,
      Function(File) ifImageAlreadyPresent) async {
    File image;
    if (advertisingUnitsAdsMap.containsKey(advertisingUnit.adTimeInterval)) {
      image = advertisingUnitsAdsMap[advertisingUnit.adTimeInterval];
      ifImageAlreadyPresent(image);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
      advertisingUnitsAdsMap.putIfAbsent(
          advertisingUnit.adTimeInterval, () => image);
    }
    return image.path;
  }

  void requestImageChangeForAdvertisingUnit(
      AdvertisingUnit advertisingUnit) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null)
      advertisingUnitsAdsMap.update(
          advertisingUnit.adTimeInterval, (imageFile) => image);
  }

  Future<bool> doesThisAdUnitHasAnAdImage(AdvertisingUnit adUnit) async{
    if(advertisingUnitsAdsMap.containsKey(adUnit.adTimeInterval)){
      File adImage = advertisingUnitsAdsMap[adUnit.adTimeInterval];
      return  adImage!=null && await adImage.exists();

    }
    return false;
  }
}
