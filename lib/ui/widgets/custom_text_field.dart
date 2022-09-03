import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class CustomTextField extends Container {
  CustomTextField({
    Key? formFieldKey,
    double? height,
    Widget? prefix,
    TextEditingController? controller,
    Color? fillColor,
    double? hintTextSize,
    Color? hintTextColor,
    double? borderRadiusSize,
    String? hintText,
    Widget? suffix,
    Color? textColor,
    Color? validationColor,
    double? validationFontSize,
    FontWeight? validationFontWeight,
    bool readonly = false,
    String? initialValue,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    FormFieldSetter<String>? onSaved,
    bool? enabled,
    Color? cursorColor,
    Color? focusBorderColor,
    ValueChanged<String>? onFieldSubmitted,
    bool obscureText = false,
    String obscuringCharacter = "*",
    FocusNode? focusNode,
    // InputDecoration? inputDecoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    bool autoFocus = false,
    int? maxLength,
    int? maxLines = 1,
    int? minLines = 1,
    bool expands = false,
    EdgeInsets? contentPadding,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
  }) : super(
          key: key,
          height: height,
          margin: margin,
          padding: padding,
          child: Column(
            children: [
              TextFormField(
                maxLength: maxLength,
                readOnly: readonly,
                autofocus: autoFocus,
                controller: controller,
                initialValue: initialValue,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                style: GoogleFonts.sourceSansPro(
                  color: textColor,
                ),
                textDirection: textDirection,
                validator: validator,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
                onSaved: onSaved,
                enabled: enabled,
                focusNode: focusNode,
                cursorColor: cursorColor,
                onFieldSubmitted: onFieldSubmitted,
                obscureText: obscureText,
                obscuringCharacter: obscuringCharacter,
                key: formFieldKey,
                decoration: //inputDecoration ??
                    InputDecoration(
                  prefixIcon: prefix,
                  errorStyle: GoogleFonts.sourceSansPro(
                    color: validationColor ?? BrandColors.kErrorColor,
                    fontWeight: validationFontWeight ?? FontWeight.normal,
                    fontSize: validationFontSize ?? BrandSizes.h5,
                  ),
                  fillColor: fillColor,
                  filled: true,
                  contentPadding: contentPadding ??
                      EdgeInsets.only(
                        left: BrandSizes.textFieldHPaddingMedium,
                      ),
                  suffixIcon: suffix != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: BrandSizes.hPaddingSmallest,
                            vertical: BrandSizes.vPaddingSmallest,
                          ),
                          child: suffix,
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        BrandSizes.textFieldDefaultRadius,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: BrandColors.kGrey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        BrandSizes.textFieldDefaultRadius,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: focusBorderColor ?? BrandColors.kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        BrandSizes.textFieldDefaultRadius,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        BrandSizes.textFieldDefaultRadius,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: validationColor ?? BrandColors.kErrorColor,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        BrandSizes.textFieldDefaultRadius,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: validationColor ?? BrandColors.kErrorColor,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.sourceSansPro(
                    fontSize: hintTextSize ?? 16.0,
                    fontWeight: FontWeight.normal,
                    color: hintTextColor,
                  ),
                ),
              ),
            ],
          ),
        );
}
