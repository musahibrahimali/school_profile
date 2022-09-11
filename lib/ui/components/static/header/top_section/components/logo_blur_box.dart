import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileLogoAndBlurBox extends StatelessWidget {
  const MobileLogoAndBlurBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: MobileGlassContent(size: size),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
