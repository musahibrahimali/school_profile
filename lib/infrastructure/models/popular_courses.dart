import 'package:flutter/material.dart';

class Course {
  final int id;
  final String title, image;
  final Color color;

  Course({
    required this.id,
    required this.title,
    required this.image,
    required this.color,
  });
}

// For demo list of service
List<Course> popularCourses = [
  Course(
    id: 1,
    title: "General Arts",
    image: "Assets.imagesGraphic",
    color: const Color(0xFFD9FFFC),
  ),
  Course(
    id: 2,
    title: "General Science",
    image: "Assets.imagesDesktop",
    color: const Color(0xFFE4FFC7),
  ),
  Course(
    id: 3,
    title: "Business",
    image: "Assets.imagesUi",
    color: const Color(0xFFFFF3DD),
  ),
  Course(
    id: 4,
    title: "Visual Arts",
    image: "Assets.imagesInteractionDesign",
    color: const Color(0xFFFFE0E0),
  ),
];
