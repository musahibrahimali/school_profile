import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  static const String id = "user_profile_page";
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}
