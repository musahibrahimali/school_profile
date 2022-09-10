import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kDefaultPadding = 20.0;

const musicUnitMs = 6165;

final GetIt locator = GetIt.instance; // locator for url launcher services

CameraPosition get googlePlex => const CameraPosition(
      target: LatLng(6.673175, -1.565423),
      zoom: 18.4746,
    );

String get mapKey => 'AIzaSyCWG3_YJnepd_mVCfv-sAIDTkCAjkCSGqU';

final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: const Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField design
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

// home screen page controller
late PageController pageController;
late Position currentPosition;
