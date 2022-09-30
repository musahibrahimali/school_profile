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

  getDistance({required SchoolModel school}) async {
    distance = await HelperMethods.getDistance(
      fromLat: currentPosition.latitude,
      fromLng: currentPosition.longitude,
      toLat: school.mapAddress!.latitude ?? 0.0,
      toLng: school.mapAddress!.longitude ?? 0.0,
    );
    setState(() {
      distance = distance;
    });
    // debugPrint("distance is $distance");
    return distance;
  }

  @override
  Widget build(BuildContext context) {
    getDistance(school: widget.school);
    // print distance to 2 decimal places
    final String distanceString = distance.toStringAsFixed(2);

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RadialProgress(
              width: 4.0,
              goalCompleted: 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1500.0),
                child: CachedNetworkImage(
                  width: 100.0,
                  height: 100.0,
                  imageUrl: widget.school.avatar ?? widget.school.images![0],
                  fit: BoxFit.contain,
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
            const SizedBox(height: 10.0),
            ClipRRect(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10.0),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          child: CustomText(
                            text: widget.school.name ?? "",
                            maxLines: 10,
                            color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                            fontWeight: FontWeight.w900,
                            fontSize: 2.2.h,
                            height: 1.2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
