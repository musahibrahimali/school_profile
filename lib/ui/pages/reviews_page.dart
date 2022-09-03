import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  static const String id = "reviews_page";
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('reviews Page'),
      ),
    );
  }
}
