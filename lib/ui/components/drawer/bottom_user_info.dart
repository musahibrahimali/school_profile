import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class BottomUserInfo extends StatelessWidget {
  final bool isCollapsed;

  const BottomUserInfo({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint("user admin status: ${userController.currentUserInfo.isAdmin}");

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCollapsed ? 70 : 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isCollapsed
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
                pageController.animateToPage(3, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              },
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1500.0),
                          child: CachedNetworkImage(
                            width: 40.0,
                            height: 40.0,
                            imageUrl: userController.currentUserInfo.profile!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.iconsProfileIcon),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, dynamic) {
                              return Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Assets.iconsProfileIcon),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Obx(
                                () => CustomText(
                                  text: userController.currentUserInfo.name ?? "",
                                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomText(
                              text: userController.currentUserInfo.isAdmin != null
                                  ? userController.currentUserInfo.isAdmin!
                                      ? "ADMIN"
                                      : 'USER'
                                  : "",
                              color: themeController.isLightTheme ? BrandColors.kGrey : BrandColors.kLightGray,
                              fontSize: 12.0,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {
                            authRepo.signOut();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.id,
                              (Route<dynamic> route) => false,
                            );
                          },
                          icon: Icon(
                            LineAwesomeIcons.alternate_sign_out,
                            color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      pageController.animateToPage(3, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1500.0),
                        child: CachedNetworkImage(
                          width: 40.0,
                          height: 40.0,
                          imageUrl: userController.currentUserInfo.profile!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Assets.iconsProfileIcon),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, dynamic) {
                            return Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.iconsProfileIcon),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      // logout user and navigate to login screen
                      authRepo.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.id,
                        (Route<dynamic> route) => false,
                      );
                    },
                    icon: Icon(
                      LineAwesomeIcons.alternate_sign_out,
                      color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
