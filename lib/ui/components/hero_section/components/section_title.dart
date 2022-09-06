import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileSectionTitle extends StatelessWidget {
  const MobileSectionTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
    this.titleColor,
    this.subTitleColor,
  }) : super(key: key);

  final String title, subTitle;
  final Color color;
  final Color? titleColor;
  final Color? subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      constraints: const BoxConstraints(maxWidth: 450),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: kDefaultPadding),
            padding: const EdgeInsets.only(bottom: 52),
            width: 7,
            height: 100,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                subTitle,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: subTitleColor ?? BrandColors.kCustomTextColor,
                  fontSize: 11.0,
                ),
              ),
              Text(
                title,
                maxLines: 2,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: titleColor ?? Colors.black,
                      fontSize: 34.0,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
