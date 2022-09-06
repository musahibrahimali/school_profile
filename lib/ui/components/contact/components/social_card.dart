import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileSocialCard extends StatefulWidget {
  const MobileSocialCard({
    Key? key,
    required this.iconSrc,
    required this.name,
    required this.color,
    required this.press,
  }) : super(key: key);

  final String iconSrc, name;
  final Color color;
  final Function() press;

  @override
  _MobileSocialCardState createState() => _MobileSocialCardState();
}

class _MobileSocialCardState extends State<MobileSocialCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2,
            horizontal: kDefaultPadding * 1.5,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Row(
            children: [
              Image.asset(
                widget.iconSrc,
                height: 80,
                width: 80,
              ),
              const SizedBox(width: kDefaultPadding),
              CustomTextWidget(
                text: widget.name.toUpperCase(),
                color: BrandColors.colorText,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
