import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileTopSection extends StatelessWidget {
  const MobileTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.8;
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(
        maxHeight: 350.0,
        minHeight: 250.0,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.imagesBackground),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            MobileLogoAndBlurBox(size: size),
            const Positioned(
              bottom: 0.0,
              right: -60.0,
              child: MobilePersonPic(),
            ),
          ],
        ),
      ),
    );
  }
}
