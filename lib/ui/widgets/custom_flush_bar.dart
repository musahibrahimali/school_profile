import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

Future<dynamic> showCustomFlushBar({
  required context,
  String? messageText,
  String? title,
  String? message,
  Color? backgroundColor,
  Color? titleColor,
  Color? iconColor,
  Color? messageColor,
  double? iconSize,
  double? messageSize,
  double? titleSize,
  IconData? icon,
  Widget? titleText,
  Duration? duration,
  bool shouldIconPulse = true,
  double borderWidth = 1.0,
  Color? borderColor,
  BorderRadius? borderRadius,
  EdgeInsets padding = const EdgeInsets.all(16.0),
  EdgeInsets margin = const EdgeInsets.all(0.0),
  FlushbarPosition flushbarPosition = FlushbarPosition.TOP,
  FlushbarStyle flushbarStyle = FlushbarStyle.FLOATING,
}) {
  return Flushbar(
    title: title,
    message: message,
    flushbarPosition: flushbarPosition,
    flushbarStyle: flushbarStyle,
    messageText: messageText != null
        ? Center(
            child: CustomTextWidget(
              text: messageText,
              color: messageColor ?? BrandColors.colorWhiteAccent,
              maxLines: 3,
            ),
          )
        : null,
    titleSize: titleSize ?? 18.0,
    titleColor: titleColor ?? BrandColors.colorWhiteAccent,
    backgroundColor: backgroundColor ?? BrandColors.colorPrimary,
    messageColor: messageColor ?? BrandColors.kGrayWhite,
    shouldIconPulse: shouldIconPulse,
    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,
    margin: margin,
    padding: padding,
    icon: Icon(
      icon ?? LineAwesomeIcons.exclamation_circle,
      color: iconColor ?? BrandColors.colorWhiteAccent,
      size: iconSize,
    ),
    duration: duration ?? const Duration(seconds: 5),
  ).show(context);
}
