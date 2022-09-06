import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class PredictionTile extends StatelessWidget {
  final Prediction prediction;

  const PredictionTile({
    Key? key,
    required this.prediction,
  }) : super(key: key);

  void getPlaceDetails(String placeID, context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => const ProgressDialog(
        status: 'Please wait...',
      ),
    );

    String url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeID&key=$mapKey';

    var response = await RequestHelper.getRequest(url);

    if (response['status'] == 'OK') {
      Address thisPlace = Address();
      thisPlace.placeName = response['result']['name'];
      thisPlace.placeId = placeID;
      thisPlace.latitude = response['result']['geometry']['location']['lat'];
      thisPlace.longitude = response['result']['geometry']['location']['lng'];

      schoolController.updateAddressPoint(thisPlace);
      Navigator.pop(context);
      Navigator.pop(context);
    }

    if (response == 'failed') {
      Navigator.pop(context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        getPlaceDetails(prediction.placeId!, context);
      },
      // padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Icon(
                LineAwesomeIcons.map_marker,
                color: themeController.isLightTheme ? BrandColors.kDarkGray : BrandColors.kHighlightWhite,
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      prediction.mainText!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                        color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.kHighlightGray,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      prediction.secondaryText!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: themeController.isLightTheme ? BrandColors.colorDimText : BrandColors.colorDimText,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
