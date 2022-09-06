import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileAllInstitutions extends StatelessWidget {
  const MobileAllInstitutions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SchoolModel> schoolModels = schoolController.schools;
    // return a grid view with four containers
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.imagesRecentWorkBg),
        ),
      ),
      child: Column(
        children: [
          const MobileSectionTitle(
            title: "All Schools",
            subTitle: "Explore Ghana's finest Schools",
            color: Color(0xFFFFB100),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: 1200.0,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                allInstitutions.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: MobileInstitutionCard(
                    schoolModel: schoolModels[index],
                    press: () {
                      SchoolModel schoolModel = schoolModels[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AdminSchoolProfileScreen(schoolModel: schoolModel),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 3),
        ],
      ),
    );
  }
}
