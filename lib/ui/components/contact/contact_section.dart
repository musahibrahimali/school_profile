import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class MobileContactSection extends StatelessWidget {
  const MobileContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // this height only for demo
        // height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? const Color(0xFFE8F0F9) : BrandColors.colorDarkTheme,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Assets.imagesBgImg2),
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: kDefaultPadding * 2.5),
            MobileSectionTitle(
              title: "Contact Us",
              subTitle: "For Project inquiry and information",
              color: const Color(0xFF07E24A),
              titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
              subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
            ),
            const MobileContactBox(),
            const SizedBox(height: kDefaultPadding * 2.5),
          ],
        ),
      ),
    );
  }
}

class MobileContactBox extends StatelessWidget {
  const MobileContactBox({
    Key? key,
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
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MobileSocialCard(
                    color: themeController.isLightTheme ? const Color(0xFFD9FFFC) : BrandColors.colorDarkTheme,
                    iconSrc: Assets.imagesSkype,
                    name: 'miastudios Inc',
                    press: () {},
                  ),
                  const SizedBox(width: 15.0),
                  MobileSocialCard(
                    color: themeController.isLightTheme ? const Color(0xFFE4FFC7) : BrandColors.colorDarkTheme,
                    iconSrc: Assets.imagesWhatsapp,
                    name: 'miastudios Inc',
                    press: () {},
                  ),
                  const SizedBox(width: 15.0),
                  MobileSocialCard(
                    color: themeController.isLightTheme ? const Color(0xFFE8F0F9) : BrandColors.colorDarkTheme,
                    iconSrc: Assets.imagesMessanger,
                    name: 'miastudios Inc',
                    press: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding * 2),
            const MobileContactForm(),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}

class MobileContactForm extends StatelessWidget {
  const MobileContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470.0,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(
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
                prefixIcon: Icon(
                  LineAwesomeIcons.user_shield,
                  color: Colors.blue[200],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 470.0,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Email Address",
                labelStyle: TextStyle(
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
                prefixIcon: Icon(
                  LineAwesomeIcons.envelope,
                  color: Colors.blue[200],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 470.0,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Type",
                labelStyle: TextStyle(
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
                prefixIcon: Icon(
                  LineAwesomeIcons.gift,
                  color: Colors.blue[200],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 470.0,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Budget",
                labelStyle: TextStyle(
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
                prefixIcon: Icon(
                  LineAwesomeIcons.dollar_sign,
                  color: Colors.blue[200],
                ),
              ),
            ),
          ),
          SizedBox(
            child: TextFormField(
              minLines: 10,
              maxLines: 500,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: TextStyle(
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
                text: "Contact Me!",
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
