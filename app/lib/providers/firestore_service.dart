import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
/*
class FirestoreService {
  Future subirFirebase(BuildContext context) async {
    String fileName = basename(_imagen.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }
}
*/