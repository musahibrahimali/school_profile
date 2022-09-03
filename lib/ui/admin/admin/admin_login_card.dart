import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class AdminLoginCard extends StatefulWidget {
  final void Function()? onPageChange;
  const AdminLoginCard({
    Key? key,
    this.onPageChange,
  }) : super(key: key);

  @override
  State<AdminLoginCard> createState() => _AdminLoginCardState();
}

class _AdminLoginCardState extends State<AdminLoginCard> {
  bool isPasswordVisible = false;

  // login
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // change the password visibility
  void _changePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 60.0.h,
        width: 90.0.w,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0.w,
        ),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(
            BrandSizes.cardRadius,
          ),
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
                  controller: emailController,
                  prefix: Icon(
                    LineAwesomeIcons.envelope,
                    color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: BrandColors.colorDarkBlue,
                  textColor: BrandColors.colorGreen,
                  hintText: 'example@email.com',
                  hintTextSize: 1.8.h,
                  hintTextColor: BrandColors.colorText.withOpacity(0.5),
                ),
                const SizedBox(height: 15.0),
                // email address field
                CustomTextField(
                  controller: passwordController,
                  prefix: Icon(
                    LineAwesomeIcons.lock,
                    color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                  ),
                  suffix: InkWell(
                    onTap: () => _changePasswordVisibility(),
                    child: Icon(
                      isPasswordVisible ? LineAwesomeIcons.eye : LineAwesomeIcons.eye_slash,
                      color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: BrandColors.colorDarkBlue,
                  textColor: BrandColors.colorGreen,
                  obscureText: !isPasswordVisible,
                  hintText: 'Password',
                  hintTextSize: 1.8.h,
                  hintTextColor: BrandColors.colorText.withOpacity(0.5),
                ),
                const SizedBox(height: 20.0),

                // login button
                CustomTextButton(
                  onPressed: () async {
                    showLoading(context);
                    bool response = await HelperMethods.loginUser(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    if (mounted) {}
                    if (response) {
                      userController.initUser();
                      Navigator.pop(context);
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
                        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorBackground,
                      );
                    } else {
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
                        message: 'An error occurred while logging in to your account',
                        messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                        icon: LineAwesomeIcons.exclamation_circle,
                        iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                      );
                    }
                  },
                  text: 'Login'.toUpperCase(),
                  textColor: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                  buttonColor: BrandColors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 24.0,
                ),

                // switch to register page
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                        fontSize: 1.8.h,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: widget.onPageChange ?? () => {},
                      child: Text(
                        'Register'.toUpperCase(),
                        style: TextStyle(
                          color: BrandColors.colorPrimaryDark,
                          fontSize: 1.6.h,
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
    );
  }
}
