import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class RegisterSchoolScreen extends StatefulWidget {
  static const String id = "register_school_screen";
  const RegisterSchoolScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSchoolScreen> createState() => _RegisterSchoolScreenState();
}

class _RegisterSchoolScreenState extends State<RegisterSchoolScreen> {
  @override
  void initState() {
    userController.initUser();
    debugPrint("user logged in: ${userController.isUserLoggedIn}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xffF06A66),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: const SafeArea(
          child: NameAndSlogan(),
        ),
      ),
    );
  }
}
