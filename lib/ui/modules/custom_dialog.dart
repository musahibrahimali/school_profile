import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final String? buttonText;
  final void Function()? onPressed;
  final Widget? child;
  const CustomDialog({
    Key? key,
    this.title,
    this.description,
    this.buttonText,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: child ??
                Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Text(
                      title ?? 'Something went wrong',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 22.0,
                        color: BrandColors.colorPrimaryDark,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    BrandDivider(color: BrandColors.colorPink),
                    const SizedBox(height: 25.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextWidget(
                        text: description ?? 'An error was encountered, please try again',
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        color: BrandColors.colorText,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: 200.0,
                      child: CustomOutlineButton(
                        onPressed: onPressed ??
                            () {
                              Navigator.pop(context);
                            },
                        title: buttonText ?? "CLOSE",
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
