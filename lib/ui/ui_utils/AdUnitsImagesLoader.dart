import 'dart:collection';
import 'dart:io';

import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/AdvertisingUnit.dart';
import 'package:image_picker/image_picker.dart';

class AdUnitsImagesLoader {
  Map<AdTimeInterval, File> advertisingUnitsAdsMap;

  AdUnitsImagesLoader() {
    advertisingUnitsAdsMap = HashMap();
  }

  void loadImageForThisAdvertisingUnit(AdvertisingUnit advertisingUnit,
      Function(File) ifImageAlreadyPresent) async {
    var image;
    if (advertisingUnitsAdsMap.containsKey(advertisingUnit.adTimeInterval)) {
      image = advertisingUnitsAdsMap[advertisingUnit.adTimeInterval];
      ifImageAlreadyPresent(image);
      //advertisingUnitsAdsMap.update(adtimeInterval, (file) => image);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
      advertisingUnitsAdsMap.putIfAbsent(
          advertisingUnit.adTimeInterval, () => image);
    }
  }

  void requestImageChangeForAdvertisingUnit(
      AdvertisingUnit advertisingUnit) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null)
      advertisingUnitsAdsMap.update(
          advertisingUnit.adTimeInterval, (imageFile) => image);
  }
}
