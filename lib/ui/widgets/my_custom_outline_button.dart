import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    Key? key,
    required this.imageSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageSrc, text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: kDefaultPadding * 2.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: Color(0xFFEDEDED)),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              imageSrc,
              height: 40.0,
            ),
            const SizedBox(width: kDefaultPadding),
            Text(text)
          ],
        ),
      ),
    );
  }
}
