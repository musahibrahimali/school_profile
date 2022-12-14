import 'package:flutter/material.dart';
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

  Future<bool> loadPreferences() async {
    return true;
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
      if (schoolController.schools.isEmpty) {
        // get all schools
        HelperMethods.getAllSchools();
      }
    });
    HelperMethods.setupPositionLocator(context: context);

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
                    color: themeController.isLightTheme ? Colors.grey.withOpacity(0.5) : Colors.transparent,
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
                    child: schoolController.isUsingSearch
                        ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              controller: searchSchoolController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.start,
                              autofocus: false,
                              onFieldSubmitted: (value) {
                                searchSchoolController.text = schoolController.addressPoint.placeName!;
                                setState(() {});
                              },
                              onEditingComplete: () {
                                searchSchoolController.text = schoolController.addressPoint.placeName!;
                                setState(() {});
                              },
                              onChanged: (value) async {
                                schoolController.clearFilteredSchools();
                                schoolController.filterSchools(value);
                              },
                              keyboardAppearance: themeController.isLightTheme ? Brightness.light : Brightness.dark,
                              style: GoogleFonts.montserrat(
                                color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                              ),
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
                          )
                        : const FilterStrip(),
                  ),
                  IconButton(
                    onPressed: () {
                      schoolController.changeIsUsingSearch(!schoolController.isUsingSearch);
                    },
                    icon: Icon(
                      !schoolController.isUsingSearch ? LineAwesomeIcons.search : Icons.filter_list,
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
                if (index == 3 && userController.isUserLoggedIn)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 30.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SettingsPage.id);
                          },
                          child: Icon(
                            LineAwesomeIcons.cog,
                            color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                            size: 32.0,
                          ),
                        ),
                      ],
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
