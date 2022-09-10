import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class BlogsPage extends StatefulWidget {
  static const String id = "blogs_page";
  const BlogsPage({Key? key}) : super(key: key);

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Container(
                    color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                    ),
                    child: const MobileImageCarousel(height: 300.0),
                  ),
                ),
                Column(
                  children: List.generate(
                    blogPosts.length,
                    (index) => BlogPostCard(
                      blog: blogPosts[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
