import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileAppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      // splash
      case MobileRoutesPaths.coreSplash:
        return MaterialPageRoute(
          builder: (_) => Container(),
          // builder: (_) => const MobileLayout(),
          settings: settings,
        );

      // Home page
      case MobileRoutesPaths.home:
        return NavigationFadeTransition(
          // const MobileHomePage(),
          Container(),
          settings: settings,
        );

      // schools page
      case MobileRoutesPaths.institutions:
        return NavigationFadeTransition(
          Container(),
          // const DesktopSchoolsPage(),
          settings: settings,
        );

      // about page
      case MobileRoutesPaths.about:
        return NavigationFadeTransition(
          Container(),
          // const MobileAboutPage(),
          settings: settings,
        );

      // reviews page
      case MobileRoutesPaths.reviews:
        return NavigationFadeTransition(
          Container(),
          // const MobileReviewsPage(),
          settings: settings,
        );

      // blogs page
      case MobileRoutesPaths.blogs:
        return NavigationFadeTransition(
          Container(),
          // const MobileBlogsPage(),
          settings: settings,
        );

      // auth page
      case MobileRoutesPaths.auth:
        return NavigationFadeTransition(
          Container(),
          // const MobileAuthPage(),
          settings: settings,
        );

      // case RoutePaths.coreNoInternet:
      //   final args = settings.arguments as Map?;
      //   return MaterialPageRoute(
      //     builder: (_) => NoInternetConnection(
      //       fromSplash: args?['fromSplash'],
      //     ),
      //     settings: settings,
      //   );

      // school Profile
      case MobileRoutesPaths.schoolProfile:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => Container(),
          // builder: (_) => MobileSchoolPage(
          //   schoolId: args?['schoolId'],
          // ),
          settings: settings,
        );

      default:
        return NavigationFadeTransition(
          Container(),
          // const MobileLayout(),
          settings: settings,
        );
    }
  }
}
