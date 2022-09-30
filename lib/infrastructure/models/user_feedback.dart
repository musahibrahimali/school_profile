import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class Feedback {
  final String name, review, userPic;
  final int id;
  final Color color;

  Feedback({
    required this.name,
    required this.review,
    required this.userPic,
    required this.id,
    required this.color,
  });
}

// List of demo feedbacks
List<Feedback> feedbacks = [
  Feedback(
    id: 1,
    name: "Toobu Nabie D.",
    review: review,
    userPic: Assets.groupNabbie,
    color: const Color(0xFFFFF3DD),
  ),
  Feedback(
    id: 2,
    name: "Sylvester Owusu",
    review: review,
    userPic: Assets.groupSly,
    color: const Color(0xFFD9FFFC),
  ),
  Feedback(
    id: 3,
    name: "Musah Ibrahim Ali",
    review: review,
    userPic: Assets.groupMusah,
    color: const Color(0xFFFFE0E0),
  ),
];

String review = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua enim ad minim veniam.';
