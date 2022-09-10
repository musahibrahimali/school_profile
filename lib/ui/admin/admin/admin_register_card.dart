import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class AdminRegisterCard extends StatefulWidget {
  final void Function()? onPageChange;
  const AdminRegisterCard({Key? key, this.onPageChange}) : super(key: key);

  @override
  State<AdminRegisterCard> createState() => _AdminRegisterCardState();
}

class _AdminRegisterCardState extends State<AdminRegisterCard> {
  bool isRegisterPasswordVisible = false;

  // register
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // change the register password visibility
  void _changeRegisterPasswordVisibility() {
    setState(() {
      isRegisterPasswordVisible = !isRegisterPasswordVisible;
    });
  }

  @override
  void initState() {
    isRegisterPasswordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Container(
          height: 68.0.h,
          width: 90.0.w,
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0.w,
          ),
          decoration: BoxDecoration(
            color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
            boxShadow: [kDefaultShadow],
            borderRadius: BorderRadius.circular(BrandSizes.cardRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60.0,
                backgroundColor: BrandColors.colorDarkTheme,
                child: Image.asset(
                  Assets.imagesLogo,
                ),
              ),
              const SizedBox(height: 20.0),
              // add a form here
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // email address field
                  CustomTextField(
                    controller: nameController,
                    prefix: Icon(
                      LineAwesomeIcons.user_check,
                      color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                    ),
                    focusBorderColor: BrandColors.colorDarkBlue,
                    keyboardType: TextInputType.text,
                    cursorColor: themeController.isLightTheme ? BrandColors.colorDarkBlue : BrandColors.colorWhiteAccent,
                    textColor: themeController.isLightTheme ? BrandColors.colorGreen : BrandColors.colorWhiteAccent,
                    hintText: 'John Doe',
                    hintTextSize: 1.8.h,
                    hintTextColor: themeController.isLightTheme ? BrandColors.colorText.withOpacity(0.5) : BrandColors.colorWhiteAccent.withOpacity(0.5),
                  ),
                  SizedBox(height: 2.0.h),
                  // email address field
                  CustomTextField(
                    controller: emailController,
                    prefix: Icon(
                      LineAwesomeIcons.envelope,
                      color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                    ),
                    focusBorderColor: BrandColors.colorDarkBlue,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: themeController.isLightTheme ? BrandColors.colorDarkBlue : BrandColors.colorWhiteAccent,
                    textColor: themeController.isLightTheme ? BrandColors.colorGreen : BrandColors.colorWhiteAccent,
                    hintText: 'example@email.com',
                    hintTextSize: 1.8.h,
                    hintTextColor: themeController.isLightTheme ? BrandColors.colorText.withOpacity(0.5) : BrandColors.colorWhiteAccent.withOpacity(0.5),
                  ),
                  SizedBox(height: 2.0.h),
                  // email address field
                  CustomTextField(
                    controller: passwordController,
                    prefix: Icon(
                      LineAwesomeIcons.lock,
                      color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                    ),
                    suffix: InkWell(
                      onTap: () => _changeRegisterPasswordVisibility(),
                      child: Icon(
                        isRegisterPasswordVisible ? LineAwesomeIcons.eye : LineAwesomeIcons.eye_slash,
                        color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                      ),
                    ),
                    focusBorderColor: BrandColors.colorDarkBlue,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: themeController.isLightTheme ? BrandColors.colorDarkBlue : BrandColors.colorWhiteAccent,
                    textColor: themeController.isLightTheme ? BrandColors.colorGreen : BrandColors.colorWhiteAccent,
                    obscureText: !isRegisterPasswordVisible,
                    hintText: 'Password',
                    hintTextSize: 1.8.h,
                    hintTextColor: themeController.isLightTheme ? BrandColors.colorText.withOpacity(0.5) : BrandColors.colorWhiteAccent.withOpacity(0.5),
                  ),
                  SizedBox(height: 5.0.h),

                  // login button
                  CustomTextButton(
                    onPressed: () async {
                      showLoading(context);
                      bool response = await HelperMethods.registerUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        name: nameController.text.trim(),
                        isAdmin: true,
                      );
                      if (mounted) {}
                      if (response) {
                        userController.initUser();
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                        userController.initUser();
                        Navigator.pushNamedAndRemoveUntil(context, RegisterSchoolScreen.id, (route) => false);
                        showCustomFlushBar(
                          context: context,
                          title: 'Success',
                          borderRadius: BorderRadius.circular(50.0),
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0.w,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.0.w,
                            vertical: 1.0.h,
                          ),
                          titleColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                          message: 'You are now logged in',
                          messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                          icon: LineAwesomeIcons.check_circle,
                          iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                          backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                        );
                      } else {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                        showCustomFlushBar(
                          context: context,
                          title: 'Error',
                          borderRadius: BorderRadius.circular(50.0),
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0.w,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.0.w,
                            vertical: 1.0.h,
                          ),
                          titleColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                          message: 'An error occurred while registering your account',
                          messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                          icon: LineAwesomeIcons.exclamation_circle,
                          iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                          backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                        );
                      }
                    },
                    text: 'Register'.toUpperCase(),
                    textColor: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorText,
                    buttonColor: themeController.isLightTheme ? BrandColors.colorDarkBlue : BrandColors.colorWhiteAccent,
                    fontWeight: FontWeight.w900,
                    fontSize: 2.4.h,
                  ),

                  // switch to register page
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                          fontSize: 1.8.h,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      InkWell(
                        onTap: widget.onPageChange ?? () => {},
                        child: Text(
                          'Login'.toUpperCase(),
                          style: TextStyle(
                            color: themeController.isLightTheme ? BrandColors.colorAccentPurple : BrandColors.colorDarkGreen,
                            fontSize: 1.8.h,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
