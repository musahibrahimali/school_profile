import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class AdminSchoolProfileScreen extends StatefulWidget {
  static const String id = 'admin_school_profile_screen';
  final SchoolModel schoolModel;
  const AdminSchoolProfileScreen({
    Key? key,
    required this.schoolModel,
  }) : super(key: key);

  @override
  State<AdminSchoolProfileScreen> createState() => _AdminSchoolProfileScreenState();
}

class _AdminSchoolProfileScreenState extends State<AdminSchoolProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
