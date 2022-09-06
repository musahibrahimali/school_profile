import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class MobileContactSection extends StatelessWidget {
  const MobileContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.imagesBgImg2),
        ),
      ),
      child: Column(
        children: const [
          SizedBox(height: kDefaultPadding * 2.5),
          MobileSectionTitle(
            title: "Contact Us",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          MobileContactBox(),
          SizedBox(height: kDefaultPadding * 2.5),
        ],
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
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      padding: const EdgeInsets.all(kDefaultPadding * 1),
      decoration: BoxDecoration(
        color: BrandColors.colorBackground,
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
                  color: const Color(0xFFD9FFFC),
                  iconSrc: Assets.imagesSkype,
                  name: 'miastudios Inc',
                  press: () {},
                ),
                const SizedBox(width: 15.0),
                MobileSocialCard(
                  color: const Color(0xFFE4FFC7),
                  iconSrc: Assets.imagesWhatsapp,
                  name: 'miastudios Inc',
                  press: () {},
                ),
                const SizedBox(width: 15.0),
                MobileSocialCard(
                  color: const Color(0xFFE8F0F9),
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
