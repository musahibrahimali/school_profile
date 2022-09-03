import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_profile/index.dart';

class PopUpPage extends StatelessWidget {
  final Widget child;
  final bool appBarSkipAble;
  final bool appBarWithMenu;
  final bool appBarWithBack;
  final Function? skipBehaviour;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool showBackgroundImage;
  final bool fixedNavigationBarColor;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final Widget? backButtonWidget;
  final double? appbarHeight;
  final List<Widget> appbarItems;
  final Widget? drawer;
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final dynamic result;
  final Future<bool> Function()? onWillPop;
  final Color? appBarColor;
  final Color? backButtonColor;
  final bool? safeAreaTop;
  final bool? safeAreaBottom;
  final bool showUpperShadow;

  const PopUpPage({
    Key? key,
    this.child = const SizedBox(),
    this.appBarSkipAble = false,
    this.appBarWithMenu = false,
    this.appBarWithBack = false,
    this.showBackgroundImage = false,
    this.skipBehaviour,
    this.scaffoldKey,
    this.fixedNavigationBarColor = false,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = false,
    this.appbarHeight,
    this.appbarItems = const [],
    this.drawer,
    this.floatingActionButton,
    this.onWillPop,
    this.result,
    this.appBarColor,
    this.backButtonColor,
    this.backButtonWidget,
    this.safeAreaTop,
    this.showUpperShadow = false,
    this.safeAreaBottom,
    this.appBar,
  })  : assert((appBarSkipAble ^ (skipBehaviour == null)) && (appBarWithMenu ^ (scaffoldKey == null))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ?? () => Future.value(true),
      child: SafeArea(
        top: safeAreaTop ?? false,
        bottom: safeAreaBottom ?? false,
        minimum: EdgeInsets.only(
          bottom: ScreenUtil().bottomBarHeight,
        ),
        child: Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: appBar,
          drawer: drawer,
          floatingActionButton: floatingActionButton,
          body: Stack(
            alignment: Alignment.center,
            children: [
              child,
              if (showUpperShadow)
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: BrandSizes.screenTopShadowHeight,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xde000000), Color(0x00000000)],
                        stops: [0, 0.4],
                        begin: Alignment.topCenter,
                        end: Alignment(0, .1),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
