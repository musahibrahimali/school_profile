import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class OpaqueImage extends StatelessWidget {
  final String imageUrl;

  const OpaqueImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
          child: CachedNetworkImage(
            width: double.infinity,
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.updatesNews),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, dynamic) {
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.updatesNews),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        // Image.asset(
        //   imageUrl,
        //   width: double.maxFinite,
        //   height: double.maxFinite,
        //   fit: BoxFit.fill,
        // ),
        Container(
          color: BrandColors.colorPrimary.withOpacity(0.85),
        ),
      ],
    );
  }
}
