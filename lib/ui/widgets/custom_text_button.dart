import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class CustomTextButton extends StatelessWidget {
  final double minHeight;
  final double minWidth;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? textColor;
  final Color? splashColor;
  final Color? shadowColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;
  final MaterialTapTargetSize? tapTargetSize;

  const CustomTextButton({
    this.minHeight = 0,
    this.minWidth = 0,
    this.child,
    this.text,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.padding,
    this.onLongPress,
    this.tapTargetSize,
    Key? key,
    this.textColor,
    this.fontWeight,
    this.fontSize,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: shape,
          elevation: elevation ?? 0,
          backgroundColor: buttonColor,
          primary: splashColor ?? BrandColors.colorPrimary,
          shadowColor: shadowColor,
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: BrandSizes.vPaddingTiny,
                horizontal: BrandSizes.hPaddingSmallest,
              ),
          minimumSize: Size(minWidth, minHeight),
          tapTargetSize: tapTargetSize,
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child ??
            CustomTextWidget(
              text: text!,
              color: textColor ?? BrandColors.colorPrimary,
              textAlign: TextAlign.center,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize ?? 22.0,
            ),
      ),
    );
  }
}
