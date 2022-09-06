import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class SearchPlaceDraggableContent extends StatelessWidget {
  final List<Prediction> addressList;
  final ScrollController scrollController;
  final bool isExpanded;

  const SearchPlaceDraggableContent({
    Key? key,
    required this.scrollController,
    required this.isExpanded,
    required this.addressList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorDarkTheme,
        elevation: 10.0,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 130.0),
                  decoration: BoxDecoration(
                    color: themeController.isLightTheme ? BrandColors.kGrey : BrandColors.kLightGray,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),

            // if both destinationList and pickup list are empty, show an expanded with a container
            (addressList.isNotEmpty)
                ? Expanded(
                    flex: isExpanded ? 9 : 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.only(bottom: 40.0),
                        itemCount: addressList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PredictionTile(
                            prediction: addressList[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const BrandDivider(),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
