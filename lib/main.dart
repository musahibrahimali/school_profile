import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as sizer;
import 'package:school_profile/index.dart';

Future<void> main() async {
  /*
  * ############################################
  * ############# enable widgets binding #######
  * ############################################
  * */
  WidgetsFlutterBinding.ensureInitialized();
  await serviceInitializer.initializeSettings();

  /*
  * ########################################################
  * ############### initialize firebase app ################
  * ########################################################
  * */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  /*
  * #################################################################
  * ########### make sure app stays in portrait mode only ###########
  * #################################################################
  * */
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    userController.initUser();
    // post frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (userController.isUserLoggedIn == true) {
        // get user data
        HelperMethods.getUserInfo();
      }
      HelperMethods.getAllSchools();

      // ask user permission to access location and gallery if not already granted with permission handler
      HelperMethods.askPermissions(index: 0);
      HelperMethods.setupPositionLocator(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return sizer.ResponsiveSizer(
          builder: (BuildContext context, Orientation orientation, sizer.ScreenType screenType) {
            return ThemeProvider(
              initTheme: themeController.isLightTheme ? BrandThemes.lightTheme(context) : BrandThemes.darkTheme(context),
              builder: (BuildContext context, ThemeData theme) {
                return GetMaterialApp(
                  title: 'School Profiler',
                  debugShowCheckedModeBanner: false,
                  color: BrandColors.colorBackground,
                  theme: BrandThemes.lightTheme(context),
                  darkTheme: BrandThemes.darkTheme(context),
                  themeMode: themeController.isLightTheme ? ThemeMode.light : ThemeMode.dark,
                  home: const HomeScreen(),
                  routes: {
                    /// [screens]
                    HomeScreen.id: (context) => const HomeScreen(),

                    /// [admin]
                    AdminAuthScreen.id: (context) => const AdminAuthScreen(),
                    RegisterSchoolScreen.id: (context) => const RegisterSchoolScreen(),
                    AdminSchoolsScreen.id: (context) => const AdminSchoolsScreen(),

                    /// [pages]
                    HomePage.id: (context) => const HomePage(),
                    AboutPage.id: (context) => const AboutPage(),
                    SchoolsPage.id: (context) => const SchoolsPage(),
                    ReviewsPage.id: (context) => const ReviewsPage(),
                    UserProfilePage.id: (context) => const UserProfilePage(),
                    BlogsPage.id: (context) => const BlogsPage(),
                    AuthPage.id: (context) => const AuthPage(),
                    SettingsPage.id: (context) => const SettingsPage(),
                    CreditsPage.id: (context) => const CreditsPage(),
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
