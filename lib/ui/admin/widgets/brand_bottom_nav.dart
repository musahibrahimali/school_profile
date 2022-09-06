import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:onboarding/onboarding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class BrandBottomNav extends StatelessWidget {
  final int index;
  final VoidCallback function;
  final bool isButtonDisabled;
  final String? buttonText;

  const BrandBottomNav({
    Key? key,
    required this.index,
    required this.function,
    this.isButtonDisabled = false,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: BrandColors.colorPink,
          child: Container(
            height: 8.h,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 163, 160),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIndicator(
                    netDragPercent: 1,
                    pagesLength: index,
                    indicator: Indicator(
                      closedIndicator: const ClosedIndicator(color: Colors.white),
                      activeIndicator: const ActiveIndicator(color: Colors.white30),
                      indicatorDesign: IndicatorDesign.polygon(
                        polygonDesign: PolygonDesign(
                          polygonRadius: 5,
                          polygon: DesignType.polygon_circle,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: isButtonDisabled ? null : function,
                    child: Row(
                      children: <Widget>[
                        Text(
                          buttonText ?? "Next",
                          style: TextStyle(
                            color: isButtonDisabled ? BrandColors.kGrey : Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            LineAwesomeIcons.arrow_right,
                            color: isButtonDisabled ? BrandColors.kGrey : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
