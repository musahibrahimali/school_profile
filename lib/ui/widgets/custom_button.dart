import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

//Composition works better than inheritance: https://groups.google.com/g/flutter-dev/c/muVUV4z71fs/m/DS0twymQCAAJ
class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? minHeight;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final Gradient? gradientColor;
  final BorderRadiusGeometry? gradientBorderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;

  const CustomButton({
    this.height,
    this.width,
    this.minHeight,
    this.child,
    this.text,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.gradientColor,
    this.gradientBorderRadius,
    this.padding,
    this.onLongPress,
    Key? key,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                BrandSizes.roundedButtonDefaultRadius,
              ),
            ),
        elevation: elevation ?? 0,
        primary: buttonColor,
        onPrimary: splashColor,
        shadowColor: shadowColor,
        padding: padding ?? EdgeInsets.zero, //Not necessary if you added height and width.
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        height: height ?? BrandSizes.roundedButtonDefaultHeight,
        width: width ?? BrandSizes.roundedButtonDefaultWidth,
        constraints: BoxConstraints(
          minHeight: minHeight ?? BrandSizes.roundedButtonMinHeight,
        ),
        decoration: buttonColor == null
            ? BoxDecoration(
                borderRadius: gradientBorderRadius ?? BorderRadius.circular(BrandSizes.roundedButtonDefaultRadius),
                gradient: gradientColor,
              )
            : null,
        child: child ??
            CustomText(
              text: text!,
              color: buttonColor == null ? BrandColors.colorBackground : BrandColors.colorWhiteAccent,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
