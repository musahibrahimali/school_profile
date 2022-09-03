import 'package:flutter/material.dart';

class LoadingIndicators {
  LoadingIndicators._();

  static final instance = LoadingIndicators._();

  Widget smallLoadingAnimation(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    return Center(
      child: Container(
        color: Colors.transparent,
        // child: Lottie.asset(
        //   Assets.animationsLoadingColorfulBars,
        //   height: height ?? BrandSizes.loadingAnimationDefaultHeight,
        //   width: width ?? BrandSizes.loadingAnimationDefaultWidth,
        // ),
      ),
    );
  }
}
