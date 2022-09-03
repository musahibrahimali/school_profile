import 'package:school_profile/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

// controller instances
ThemeController themeController = ThemeController.instance;
UserController userController = UserController.instance;
SchoolController schoolController = SchoolController.instance;

// shared prefs
Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

ServiceInitializer get serviceInitializer => ServiceInitializer.instance;
HelperMethods get helperMethods => HelperMethods.instance;
