import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class SchoolMapView extends StatefulWidget {
  const SchoolMapView({Key? key}) : super(key: key);

  @override
  State<SchoolMapView> createState() => _SchoolMapViewState();
}

class _SchoolMapViewState extends State<SchoolMapView> {
  late GoogleMapController _mapController;
  late Position currentPosition;

  /* boolean variables */
  bool _isExpanded = false; // works width the draggable sheet
  bool _isMapLoading = true; // is the map loading
  // is keyboard open
  bool _isKeyboardOpen = false;
  late ScrollController _scrollController; // sheets scroll controller

  /// markers
  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  final Map<CircleId, Circle> _circles = <CircleId, Circle>{};

  /// polyline
  final List<Polyline> _polyLines = [];

  /// google maps
  final Completer<GoogleMapController> _controller = Completer();
  // Init firestore and geoFlutterFire
  late Geoflutterfire geoFlutterFire;

  /* static variables */
  static double _minExtent = 0.4;
  final double _maxExtent = 0.95;

  /*double variables */
  double _percent = 0.0;
  double _initialExtent = _minExtent;

  /// set up position locator
  _setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    currentPosition = position;

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 16.5);
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(cp),
    );

    /// confirm location
    await HelperFunctions.findCoordinateAddress(position, context);
    searchAddressController.text = schoolController.addressPoint.placeName!;
  }

  @override
  void initState() {
    schoolController.addressPointList = [];
    schoolController.isSchoolLocationChosen = false;

    /// set min extent
    _minExtent = 0.4;

    /// initialize scroll controller
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    schoolController.addressPointList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if keyboard is opened
    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      setState(() {
        _isKeyboardOpen = true;
      });
    } else {
      setState(() {
        _isKeyboardOpen = false;
      });
    }

    // if (schoolController.isSchoolLocationChosen && schoolController.addressPoint.placeName != null) {
    //   _minExtent = 0.4;
    //   Navigator.pop(context);
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: themeController.isLightTheme ? const Color(0xff6078ff) : BrandColors.colorDarkTheme,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      LineAwesomeIcons.angle_left,
                      color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorBackground,
                      size: 28.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: searchAddressController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        onFieldSubmitted: (value) {
                          schoolController.addressPointList.clear();
                          searchAddressController.clear();
                          searchAddressController.text = schoolController.addressPoint.placeName!;
                          setState(() {});
                        },
                        onEditingComplete: () {
                          schoolController.addressPointList.clear();
                          searchAddressController.clear();
                          searchAddressController.text = schoolController.addressPoint.placeName!;
                          setState(() {});
                        },
                        onChanged: (value) async {
                          setState(() {
                            schoolController.addressPointList = [];
                          });
                          List<Prediction>? thisList = await HelperFunctions.searchPickUpPoint(value);
                          if (thisList!.isNotEmpty) {
                            setState(() {
                              schoolController.addressPointList = thisList;
                            });
                          }
                        },
                        keyboardAppearance: themeController.isLightTheme ? Brightness.light : Brightness.dark,
                        style: GoogleFonts.montserrat(
                          color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "Search Place",
                          hintStyle: GoogleFonts.montserrat(
                            color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                          ),
                          filled: false,
                          contentPadding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      schoolController.addressPointList = [];
                      List<Prediction>? thisList = await HelperFunctions.searchPickUpPoint(
                        searchAddressController.text.trim(),
                      );
                      if (thisList!.isNotEmpty) {
                        schoolController.addressPointList = thisList;
                      }
                    },
                    icon: Icon(
                      LineAwesomeIcons.search,
                      color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorBackground,
                      size: 28.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          /* google maps widget */
          Obx(
            () => Container(
              color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorLightGray,
              child: GoogleMap(
                initialCameraPosition: googlePlex,
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
                rotateGesturesEnabled: true,
                compassEnabled: true,
                zoomControlsEnabled: true,
                trafficEnabled: true,
                indoorViewEnabled: true,
                polylines: Set<Polyline>.of(_polyLines),
                markers: Set<Marker>.of(_markers.values),
                circles: Set<Circle>.of(_circles.values),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _mapController = controller;
                  setState(() {
                    _isMapLoading = false;
                  });
                  _setupPositionLocator();
                },
              ),
            ),
          ),
          (_isMapLoading)
              ? Obx(
                  () => Container(
                    height: BrandSizes.screenHeight,
                    width: BrandSizes.screenWidth,
                    color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorLightGray,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 10.0,
                        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorLightGray,
                      ),
                    ),
                  ),
                )
              : Container(),

          /// search sheet
          if (schoolController.addressPointList.isNotEmpty)
            Positioned.fill(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: DraggableScrollableActuator(
                child: NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    setState(() {
                      _percent = 2 * notification.extent - 0.9;
                      // if keyboard is open set the percent to 0.9 and expand the sheet
                      if (_isKeyboardOpen) {
                        _percent = 0.9;
                        _isExpanded = true;
                      }
                      if (_percent > 0.5) {
                        _isExpanded = true;
                      } else {
                        _percent = 0.0;
                        _isExpanded = false;
                        _initialExtent = 0.4;
                      }
                    });
                    return true;
                  },
                  child: DraggableScrollableSheet(
                    key: Key(_initialExtent.toString()),
                    initialChildSize: _initialExtent,
                    maxChildSize: _maxExtent,
                    minChildSize: _minExtent,
                    builder: (BuildContext context, scrollController) {
                      _scrollController = scrollController;
                      return SearchPlaceDraggableContent(
                        scrollController: _scrollController,
                        addressList: schoolController.addressPointList,
                        isExpanded: _isExpanded,
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
