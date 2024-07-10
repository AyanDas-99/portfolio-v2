import 'dart:developer' as dev;
import 'package:firebase_storage/firebase_storage.dart' deferred as storage;

class GetResumeRepository {
  Future<String?> getResumeDownloadUrl() async {
    try {
      await storage.loadLibrary();
      final storageRef = storage.FirebaseStorage.instance.ref();
      final pathRef = storageRef.child("doc/resume.pdf");
      return pathRef.getDownloadURL();
    } catch (e) {
      dev.log('Could not get resume download url', error: e);
      return null;
    }
  }
}
