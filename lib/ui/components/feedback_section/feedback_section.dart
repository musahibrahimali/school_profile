import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileFeedBackSection extends StatelessWidget {
  const MobileFeedBackSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1110.0),
      child: Column(
        children: [
          const MobileSectionTitle(
            title: "Feedbacks Received",
            subTitle: "Parent’s  and Guardians testimonials",
            color: Color(0xFF00B1FF),
          ),
          const SizedBox(height: kDefaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                feedbacks.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: MobileFeedbackCard(
                    index: index,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
