import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileImageCarousel extends StatefulWidget {
  final double? height;
  final List<String>? images;
  final bool? isImageContent;
  final List<dynamic>? content;

  const MobileImageCarousel({
    Key? key,
    this.height,
    this.images,
    this.isImageContent = true,
    this.content,
  }) : super(key: key);

  @override
  _MobileImageCarouselState createState() => _MobileImageCarouselState();
}

class _MobileImageCarouselState extends State<MobileImageCarousel> {
  List<String> defaultImages = [
    Assets.carouselCarouselImage1,
    Assets.carouselCarouselImage2,
    Assets.carouselCarouselImage3,
    Assets.carouselCarouselImage4,
    Assets.carouselCarouselImage5,
    Assets.carouselCarouselImage6,
    Assets.carouselCarouselImage7,
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      // if images is null, use the default images
      items: widget.isImageContent == true
          ? widget.images == null
              ? defaultImages.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 0.0),
                        decoration: BoxDecoration(
                          color: BrandColors.colorBackground,
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList()
              : widget.images!.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: BrandColors.colorBackground,
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList()
          : widget.content!.map((content) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: BrandColors.colorBackground,
                    ),
                    child: content,
                  );
                },
              );
            }).toList(),
      options: CarouselOptions(
        initialPage: 0,
        autoPlay: true,
        pauseAutoPlayOnTouch: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        height: widget.height,
      ),
    );
  }
}
