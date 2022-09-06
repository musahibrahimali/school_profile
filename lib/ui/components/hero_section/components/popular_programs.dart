import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileProgramCard extends StatefulWidget {
  final int index;
  const MobileProgramCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<MobileProgramCard> createState() => _MobileProgramCardState();
}

class _MobileProgramCardState extends State<MobileProgramCard> {
  Duration duration = const Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        // margin: const EdgeInsets.symmetric(vertical: 5.0),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? popularCourses[widget.index].color : BrandColors.colorLightGrayFair,
          borderRadius: BorderRadius.circular(10.0),
          // boxShadow: [kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              padding: const EdgeInsets.all(kDefaultPadding * 1.5),
              // height: 120.0,
              // width: 120.0,
              decoration: BoxDecoration(
                color: themeController.isLightTheme ? Colors.white : BrandColors.colorLightGray,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 20.0),
                    blurRadius: 30.0,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Image.asset(
                popularCourses[widget.index].image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            CustomTextWidget(
              text: popularCourses[widget.index].title,
              fontSize: 22.0,
              color: BrandColors.colorTextDark, //
            ),
          ],
        ),
      ),
    );
  }
}
