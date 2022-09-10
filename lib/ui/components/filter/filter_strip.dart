import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class FilterStrip extends StatefulWidget {
  const FilterStrip({Key? key}) : super(key: key);

  @override
  State<FilterStrip> createState() => _FilterStripState();
}

class _FilterStripState extends State<FilterStrip> {
  int _selectedIndex = 0;
  // create an array of strings to display on the strip
  final List<String> filterOptions = <String>[
    "Name",
    "Location",
    "Category",
    "Level",
    "Fees",
    "Region",
    "Town",
    "Rating",
    "Popular",
  ];

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 5.0,
        ),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? Colors.transparent : Colors.transparent,
          border: Border.all(
            color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorLightGray,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //DropDown
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 15, right: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                child: Center(
                  child: Theme(
                    data: ThemeData(
                      canvasColor: themeController.isLightTheme ? const Color(0xff6078ff) : BrandColors.colorDarkTheme,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      itemHeight: 60,
                      value: filterOptions[_selectedIndex],
                      underline: Container(
                        height: 0,
                      ),
                      elevation: 20,
                      iconSize: 28.0,
                      icon: Icon(
                        LineAwesomeIcons.angle_down,
                        color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                      ),
                      items: <DropdownMenuItem<String>>[
                        // loop through the filter options and create a dropdown menu item for each
                        for (final String option in filterOptions)
                          DropdownMenuItem(
                            value: option,
                            child: SizedBox(
                              width: 55,
                              child: AutoSizeText(
                                option,
                                style: GoogleFonts.montserrat(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                stepGranularity: 1,
                                maxFontSize: 17,
                                maxLines: 1,
                              ),
                            ),
                          ),
                      ],
                      onChanged: (String? newValue) {
                        // get the index of the selected option
                        final int index = filterOptions.indexOf(newValue!);
                        setState(() {
                          _selectedIndex = index;
                        });
                        schoolController.handleSortBy(index: index + 1);
                        debugPrint("schoolController.sortBy.value: ${schoolController.isName}");
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
