import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:school_profile/index.dart';

class ImageSelector {
  ImageSelector._();

  static final instance = ImageSelector._();

  static String? _appDocDirPath;

  Future<String> get appDocDir async {
    if (_appDocDirPath != null) return _appDocDirPath!;
    _appDocDirPath = await getAppDocDir();
    return _appDocDirPath!;
  }

  getAppDocDir() async {
    final _appDocDir = await getApplicationDocumentsDirectory();
    return _appDocDir.path;
  }

  Future<File?>? pickImage({required bool fromCamera}) async {
    try {
      final _pickedFile = await ImagePicker().pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        maxHeight: BrandSizes.pickedImageMaxSize,
        maxWidth: BrandSizes.pickedImageMaxSize,
      );
      if (_pickedFile != null) {
        return File(_pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      // AppDialogs.showDefaultErrorDialog();
      return null;
    }
  }
}
