import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<bool> openMap({required double latitude, required double longitude}) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    // convert to uri
    Uri uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      return true;
    } else {
      return false;
    }
  }

  // launch co-ordinates
  static Future<void> launchCoordinates({required double latitude, required double longitude, String? description}) async {
    MapsLauncher.launchCoordinates(latitude, longitude, '$description');
  }
}
