import 'package:flutter/material.dart';

class AdminProfilePage extends StatefulWidget {
  static const String id = "admin_profile_page";
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('admin Profile Page'),
        ),
      ),
    );
  }
}
