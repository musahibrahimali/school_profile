import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class MobileFeedbackCard extends StatefulWidget {
  const MobileFeedbackCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<MobileFeedbackCard> createState() => _MobileFeedbackCardState();
}

class _MobileFeedbackCardState extends State<MobileFeedbackCard> {
  Duration duration = const Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      child: Obx(
        () => AnimatedContainer(
          duration: duration,
          margin: const EdgeInsets.only(top: kDefaultPadding * 3),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 350.0,
          width: 350.0,
          decoration: BoxDecoration(
            color: themeController.isLightTheme ? feedbacks[widget.index].color : BrandColors.colorDarkTheme,
            border: Border.all(
              color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            children: <Widget>[
              Transform.translate(
                offset: const Offset(0, -55),
                child: AnimatedContainer(
                  duration: duration,
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
                      width: 10.0,
                    ),
                    boxShadow: [kDefaultCardShadow],
                    image: DecorationImage(
                      image: AssetImage(
                        feedbacks[widget.index].userPic,
                      ),
                    ),
                  ),
                ),
              ),
              CustomTextWidget(
                text: feedbacks[widget.index].review,
                color: themeController.isLightTheme ? BrandColors.kCustomTextColor : BrandColors.colorLightGray,
                fontSize: 18.0,
                maxLines: 10,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              CustomTextWidget(
                text: feedbacks[widget.index].name,
                fontWeight: FontWeight.w900,
                color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorLightGray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
