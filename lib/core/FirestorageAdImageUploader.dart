import 'dart:io';

import 'package:iad_advertiser/core/AdImageUploader.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirestorageAdImageUploader extends AdImageUploader{

  @override
  Future<String> uploadImage(String imageFilePath, String fileName) async {
    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask uploadTask = storageRef.putFile(
      File(imageFilePath),
      StorageMetadata(
        contentType: "image" + '/' + "jpg",
      ),
    );
    final StorageTaskSnapshot downloadUrl =
    (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    return url;
  }

}