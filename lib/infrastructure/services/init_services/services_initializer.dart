import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  /// initialize settings for mobile
  initializeSettings() async {
    //This method is used to initialize any service before the app runs (in main method)
    await initializeStorageService();
    List futures = [
      initializeDataLayer(),
      initializeConnectivity(),
    ];
    List<dynamic> result = await Future.wait([...futures]);
    return result;
  }

  /// initialize data layer
  initializeDataLayer() async {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => SchoolController());
  }

  initializeStorageService() async {
    await StorageService.instance.initialize();
  }

  initializeConnectivity() async {
    ConnectivityService.instance.initializeConnectivityListeners();
  }
}
