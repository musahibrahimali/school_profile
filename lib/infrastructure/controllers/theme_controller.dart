import 'package:get/get.dart';
import 'package:school_profile/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();

  final _isLightTheme = true.obs;

  // change the theme
  toggleTheme() {
    _isLightTheme.value = !_isLightTheme.value;
    _saveThemeStatus();
  }

  // change theme from shared pref
  initTheme() async {
    SharedPreferences prefs = await sharedPreferences;
    _isLightTheme.value = prefs.getBool('theme') ?? true;
  }

  _saveThemeStatus() async {
    SharedPreferences pref = await sharedPreferences;
    pref.setBool('theme', isLightTheme);
  }

  /*
  * ##########################################
  * ############ getters #####################
  * ##########################################
  * */
  bool get isLightTheme => _isLightTheme.value;
}
