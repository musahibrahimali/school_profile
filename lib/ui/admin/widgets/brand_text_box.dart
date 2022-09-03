import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class BrandTextBox extends StatefulWidget {
  final String label;
  final String? hint;
  final String errorMessage;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool error;
  final Function? onChanged;
  final Function? onCompleted;
  final Icon? suffixIcon;
  final int? maxLength;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool? obscureText;

  const BrandTextBox({
    Key? key,
    required this.label,
    this.hint,
    this.suffixIcon,
    required this.errorMessage,
    required this.controller,
    this.onChanged,
    required this.error,
    this.obscureText,
    this.maxLength,
    this.keyboardType,
    this.onCompleted,
    this.prefixWidget,
    this.suffixWidget,
  }) : super(key: key);

  @override
  State<BrandTextBox> createState() => _BrandTextBoxState();
}

class _BrandTextBoxState extends State<BrandTextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      onChanged: (val) => widget.onChanged!(val),
      onEditingComplete: widget.onCompleted == null
          ? () {
              FocusScope.of(context).unfocus();
            }
          : () => widget.onCompleted!(),
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: widget.controller,
      cursorColor: const Color(0xffEEEEEE),
      style: GoogleFonts.montserrat(color: const Color(0xffEEEEEE)),
      decoration: InputDecoration(
        prefix: widget.prefixWidget,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffixWidget,
        errorStyle: TextStyle(color: BrandColors.kErrorColor),
        errorText: widget.error == true ? widget.errorMessage : null,
        fillColor: Colors.white12,
        filled: true,
        label: Text(
          widget.label,
          style: const TextStyle(color: Color(0xffEEEEEE)),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Color(0xffEEEEEE),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffEEEEEE),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffEEEEEE),
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffEEEEEE),
          ),
        ),
      ),
    );
  }
}
