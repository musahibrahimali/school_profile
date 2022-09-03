import 'package:url_launcher/url_launcher.dart';

// call services
class CallServices {
  void callDriver(String phoneNumber) async {
    String url = "tel:$phoneNumber";
    // convert the url to uri
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}

class EmailServices {
  void sendEmail(String email) async {
    String url = "mailto:$email";
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}

// sms services
class SmsServices {
  void sendSms(String phoneNumber) async {
    String url = "sms:$phoneNumber";
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}

class WebServices {
  void openWebPage(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
