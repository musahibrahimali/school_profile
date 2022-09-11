import 'dart:math';

import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobilePersonPic extends StatefulWidget {
  const MobilePersonPic({
    Key? key,
  }) : super(key: key);

  @override
  State<MobilePersonPic> createState() => _MobilePersonPicState();
}

class _MobilePersonPicState extends State<MobilePersonPic> {
  List<String> availableImages = [
    Assets.studentsStudentThree,
    Assets.studentsStudentFour,
    Assets.studentsStudentThree,
    Assets.studentsStudentFour,
    Assets.studentsStudentFive,
    Assets.studentsStudentSix,
    Assets.studentsStudentSeven,
    Assets.studentsStudentEight,
  ];

  /// generate a random number to select and image from the available images
  /// list
  int _randomImage() {
    return Random().nextInt(availableImages.length);
  }

  @override
  Widget build(BuildContext context) {
    /// get the random image
    String _image = availableImages[_randomImage()];
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 350.0,
        maxHeight: 250.0,
      ),
      child: Image.asset(_image),
    );
  }
}
