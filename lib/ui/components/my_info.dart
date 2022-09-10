import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MyInfo extends StatefulWidget {
  final SchoolModel school;
  const MyInfo({Key? key, required this.school}) : super(key: key);

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  double distance = 0.0;

  void getDistance({required BuildContext context}) async {
    HelperMethods.setupPositionLocator(context: context);
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
    getDistance(context: context);
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.school.name ?? "",
                style: BrandStyles.whiteNameTextStyle,
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
                  Text(
                    "$distanceString kilometers",
                    style: BrandStyles.whiteSubHeadingTextStyle,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}