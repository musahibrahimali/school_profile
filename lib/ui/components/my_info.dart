import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class MyInfo extends StatefulWidget {
  final SchoolModel school;
  const MyInfo({Key? key, required this.school}) : super(key: key);

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  double distance = 0.0;

  void getDistance() async {
    if (widget.school.mapAddress!.latitude != null) {
      distance = await HelperMethods.getDistance(
        fromLat: currentPosition.latitude,
        fromLng: currentPosition.longitude,
        toLat: widget.school.mapAddress!.latitude!,
        toLng: widget.school.mapAddress!.longitude!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    getDistance();
    // print distance to 2 decimal places
    final String distanceString = distance.toStringAsFixed(2);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadialProgress(
            width: 4.0,
            goalCompleted: 0.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1500.0),
              child: CachedNetworkImage(
                width: 100.0,
                height: 100.0,
                imageUrl: widget.school.avatar ?? widget.school.images![0],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.updatesNews),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, dynamic) {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.updatesNews),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          GestureDetector(
            onTap: () async {
              double latitude = widget.school.mapAddress!.latitude!;
              double longitude = widget.school.mapAddress!.longitude!;
              MapUtils.launchCoordinates(
                latitude: latitude,
                longitude: longitude,
                description: widget.school.name,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(
                  text: widget.school.name ?? "",
                  maxLines: 4,
                  color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                  fontWeight: FontWeight.w900,
                  fontSize: 2.5.h,
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      Assets.iconsLocationPin,
                      width: 20.0,
                      color: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.kBigPink,
                    ),
                    const SizedBox(width: 2.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "$distanceString KM",
                          style: BrandStyles.whiteSubHeadingTextStyle,
                        ),
                        const SizedBox(width: 5.0),
                        Icon(
                          LineAwesomeIcons.directions,
                          color: BrandColors.white,
                          size: 28.0,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
