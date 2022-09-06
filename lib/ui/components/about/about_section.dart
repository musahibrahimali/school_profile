import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileAboutSection extends StatelessWidget {
  const MobileAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 2,
        vertical: kDefaultPadding * 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          MobileAboutTextWithSign(),
          SizedBox(height: kDefaultPadding * 2),
          MobileAboutSectionText(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          ),
          SizedBox(height: kDefaultPadding * 2),
          MobileExperienceCard(numOfExp: "4"),
          SizedBox(height: kDefaultPadding * 2),
          MobileAboutSectionText(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          ),
        ],
      ),
    );
  }
}
