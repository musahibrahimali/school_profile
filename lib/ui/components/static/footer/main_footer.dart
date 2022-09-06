import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileFooter extends StatefulWidget {
  const MobileFooter({Key? key}) : super(key: key);

  @override
  State<MobileFooter> createState() => _MobileFooterState();
}

class _MobileFooterState extends State<MobileFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: BrandGradients.darken,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            // navigate to the home page
            onTap: () => Navigator.pop,
            child: Image.asset(
              Assets.imagesLogo,
              width: 40.0,
              height: 40.0,
            ),
          ),
          const SizedBox(width: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomTextWidget(
                  text: AppConstants.appName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  color: BrandColors.colorWhiteAccent,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(width: 3.0),
                CustomTextWidget(
                  text: '© ${HelperFunctions.getYear()}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  color: BrandColors.colorWhiteAccent,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(width: 3.0),
                CustomTextWidget(
                  text: 'All rights reserved',
                  color: BrandColors.colorWhiteAccent,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
