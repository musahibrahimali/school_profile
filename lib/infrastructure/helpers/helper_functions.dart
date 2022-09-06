import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:school_profile/index.dart';

class HelperFunctions {
  // get the current year
  static int getYear() {
    DateTime now = DateTime.now();
    // return the current year
    return now.year;
  }

  // get current month
  static String getMonth() {
    DateTime now = DateTime.now();
    // return the current month
    return now.month.toString();
  }

  // get current day
  static String getDay() {
    DateTime now = DateTime.now();
    // return the current day
    return now.day.toString();
  }

  // get the current time
  static String getTime() {
    DateTime now = DateTime.now();
    // return the current time
    return "${now.hour}:${now.minute}:${now.second}";
  }

  // capitalize a string
  static String capitalize(String string) {
    // return the string with the first letter capitalized
    return string[0].toUpperCase() + string.substring(1);
  }

  // generate random number between two numbers
  static int generateRandomNumber(int min, int max) {
    // return a random number between the min and max
    var number = min + Random().nextInt(max - min);
    // convert the number to int
    return number.toInt();
  }

  /*
  * #############################################################################
  * #### Search for the place and its suggestion on changing the value of the ###
  * #### pick up location text box ##############################################
  * #############################################################################
  * */
  static Future<List<Prediction>?>? searchPickUpPoint(String placeName) async {
    if (placeName.length > 1) {
      String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=123254251&components=country:gh';
      dynamic response = await RequestHelper.getRequest(url);

      if (response == 'failed') {
        return null;
      }

      if (response['status'] == 'OK') {
        var predictionJson = response['predictions'];
        List<Prediction> thisList = (predictionJson as List).map((e) => Prediction.fromJson(e)).toList();
        return thisList;
      }
      return null;
    }
    return null;
  }

  // find co-ordinates
  static Future<String> findCoordinateAddress(Position position, context) async {
    String placeAddress = '';

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
      return placeAddress;
    }

    String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey';

    var response = await RequestHelper.getRequest(url);
    // print("The coordinates response is ::::::::::>>>>>>>>>>>>> $response");

    if (response != 'failed') {
      placeAddress = response['results'][0]['formatted_address'];

      Address pickupAddress = Address();

      pickupAddress.longitude = position.longitude;
      pickupAddress.latitude = position.latitude;
      pickupAddress.placeName = placeAddress;

      schoolController.updateAddressPoint(pickupAddress);
      schoolController.updateSearchSchool(pickupAddress.placeName!);
    }

    return placeAddress;
  }
}
