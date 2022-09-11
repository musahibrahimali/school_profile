import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class MobileReviewSection extends StatelessWidget {
  final void Function()? onSave;
  const MobileReviewSection({
    Key? key,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Assets.imagesBgImg2),
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: kDefaultPadding * 2.5),
            MobileSectionTitle(
              title: "Leave a review",
              subTitle: "Let your voice be heard",
              color: const Color(0xFF07E24A),
              titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
              subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
            ),
            MobileReviewBox(onSave: onSave),
            const SizedBox(height: kDefaultPadding * 2.5),
          ],
        ),
      ),
    );
  }
}

class MobileReviewBox extends StatelessWidget {
  final void Function()? onSave;
  const MobileReviewBox({
    Key? key,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: kDefaultPadding * 2),
        padding: const EdgeInsets.all(kDefaultPadding * 1),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: kDefaultPadding * 2),
            MobileReviewForm(onSave: onSave),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}

class MobileReviewForm extends StatelessWidget {
  final void Function()? onSave;
  const MobileReviewForm({
    Key? key,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            child: TextFormField(
              controller: reviewContentController,
              minLines: 10,
              maxLines: 500,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Leave a review",
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: Colors.blue[200],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.blue[200]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.blue[200]!,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: BrandColors.kErrorColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.blue[200]!,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 1),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: Assets.imagesContactIcon,
                text: "Save",
                press: onSave ?? () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
