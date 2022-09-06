import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // create scaffold key to use in scaffold builder
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedBottomBarIndex = 0;
  late List<Widget> pages;
  late List<BarItem> barItems;
  late Future<bool> future;
  late Position currentPosition;

  Future<bool> loadPreferences() async {
    return true;
  }

  /// set up position locator
  _setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    currentPosition = position;

    /// confirm location
    await HelperFunctions.findCoordinateAddress(position, context);
    debugPrint("current location place name ${schoolController.searchSchoolController.text}");
  }

  @override
  void initState() {
    super.initState();
    future = loadPreferences();

    if (userController.isUserLoggedIn == true && userController.currentUserInfo.name == null) {
      HelperMethods.getUserInfo();
    }

    // add post frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupPositionLocator();
      if (schoolController.schools.isEmpty) {
        // get all schools
        HelperMethods.getAllSchools();
      }
    });

    pageController = PageController(initialPage: selectedBottomBarIndex);
    pages = [
      const HomePage(),
      const SchoolsPage(),
      const BlogsPage(),
      const AuthPage(),
    ];
    barItems = [
      BarItem(
        icon: Icons.store_mall_directory,
        iconSize: 24,
        text: "Home",
        textSize: 18,
        color: Colors.purpleAccent[700],
      ),
      BarItem(
        icon: LineAwesomeIcons.bar_chart,
        iconSize: 24,
        text: "Schools",
        textSize: 18,
        color: const Color(0xff6078ff),
      ),
      BarItem(
        icon: LineAwesomeIcons.blog,
        iconSize: 24,
        text: "Blogs",
        textSize: 18,
        color: Colors.red,
      ),
      BarItem(
        icon: LineAwesomeIcons.user_shield,
        iconSize: 24,
        text: "Profile",
        textSize: 18,
        color: const Color(0xff009a88),
      ),
    ];
  }

  Color getAppBarColor() {
    if (selectedBottomBarIndex == 0) {
      return themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme;
    } else if (selectedBottomBarIndex == 1) {
      return themeController.isLightTheme ? const Color(0xff6078ff) : BrandColors.colorDarkTheme;
    } else if (selectedBottomBarIndex == 2) {
      return themeController.isLightTheme ? Colors.red : BrandColors.colorDarkTheme;
    } else {
      return themeController.isLightTheme ? const Color(0xff009a88) : BrandColors.colorDarkTheme;
    }
  }

  PreferredSizeWidget buildAppBar({required int index}) {
    if (index == 1) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
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
                      // open drawer
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      LineAwesomeIcons.bars,
                      color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorBackground,
                      size: 28.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: schoolController.searchSchoolController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        autofocus: false,
                        onChanged: (value) async {
                          // setState(() {
                          //   _destinationPredictionList = [];
                          // });
                          // List<Prediction>? thisList = await HelperFunctions.searchPickUpPoint(value);
                          // if (thisList!.isNotEmpty) {
                          //   setState(() {
                          //     _pickUpPointPredictionList = thisList;
                          //   });
                          // }
                        },
                        keyboardAppearance: themeController.isLightTheme ? Brightness.light : Brightness.dark,
                        decoration: InputDecoration(
                          hintText: "Search for schools",
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
                    onPressed: () {},
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
      );
    } else {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: getAppBarColor(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // open drawer
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    LineAwesomeIcons.bars,
                    color: index == 0
                        ? themeController.isLightTheme
                            ? BrandColors.colorDarkTheme
                            : BrandColors.colorWhiteAccent
                        : themeController.isLightTheme
                            ? BrandColors.colorWhiteAccent
                            : BrandColors.colorBackground,
                    size: 28.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(index: selectedBottomBarIndex),
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: FutureBuilder<bool>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    selectedBottomBarIndex = index;
                    setState(() {
                      selectedBottomBarIndex = index;
                    });
                  },
                  controller: pageController,
                  itemBuilder: (context, index) => pages[index],
                );
              }
              return Scaffold(
                backgroundColor: BrandColors.colorBackground,
                body: const SafeArea(
                  child: Center(
                    child: CircularProgressIndicator(
                      semanticsLabel: "Loading preferences",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: AnimatedBottomBar(
          backgroundColor: !themeController.isLightTheme ? BrandColors.black : BrandColors.colorBackground,
          onItemTap: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
            );
          },
          barItems: barItems,
          currBarItem: selectedBottomBarIndex,
          animationDuration: const Duration(milliseconds: 200),
          elevation: 20,
        ),
      ),
    );
  }
}
