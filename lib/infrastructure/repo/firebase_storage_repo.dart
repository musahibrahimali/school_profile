import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseStorageRepo {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // upload image to firebase storage
  Future<String> uploadImage({required File imageFile}) async {
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference storageReference = _firebaseStorage.ref().child(fileName);
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = (await downloadUrl.ref.getDownloadURL());
      return url;
    } catch (e) {
      debugPrint("There was an error ${e.toString()}");
      return '';
    }
  }

  // upload a list of images
  Future<List<String>> uploadImages({required List<File> imageFiles}) async {
    List<String> urls = [];
    for (var imageFile in imageFiles) {
      final String url = await uploadImage(imageFile: imageFile);
      urls.add(url);
    }
    return urls;
  }

  // upload avatar
  Future<String> uploadAvatar({required File avatarFile}) async {
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference storageReference = _firebaseStorage.ref().child(fileName);
      final UploadTask uploadTask = storageReference.putFile(avatarFile);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = (await downloadUrl.ref.getDownloadURL());
      return url;
    } catch (e) {
      debugPrint("There was an error ${e.toString()}");
      return '';
    }
  }

  // get image url
  Future<String> getImageUrl({required String fileName}) async {
    try {
      final Reference storageReference = _firebaseStorage.ref().child(fileName);
      final String url = await storageReference.getDownloadURL();
      return url;
    } catch (e) {
      debugPrint("There was an error ${e.toString()}");
      return '';
    }
  }

  // delete image
  Future<bool> deleteImage({required String fileName}) async {
    try {
      final Reference storageReference = _firebaseStorage.ref().child(fileName);
      await storageReference.delete();
      return true;
    } catch (e) {
      debugPrint("There was an error ${e.toString()}");
      return false;
    }
  }
}
