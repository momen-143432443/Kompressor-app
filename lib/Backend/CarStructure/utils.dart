import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_Storage;

class UtilsService {
  Future<String?> uploadPic(File image, String? path) async {
    firebase_Storage.Reference reference =
        firebase_Storage.FirebaseStorage.instance.ref(path);
    firebase_Storage.UploadTask uploadTask = reference.putFile(image);
    await uploadTask.whenComplete(() => null);
    String returnurl = '';
    await reference.getDownloadURL().then((fileUrl) {
      returnurl = fileUrl;
    });
    return returnurl;
  }
}
