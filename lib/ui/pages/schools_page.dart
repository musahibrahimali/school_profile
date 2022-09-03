import 'package:flutter/material.dart';

class SchoolsPage extends StatefulWidget {
  static const String id = "schools_page";
  const SchoolsPage({Key? key}) : super(key: key);

  @override
  State<SchoolsPage> createState() => _SchoolsPageState();
}

class _SchoolsPageState extends State<SchoolsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Schools Page'),
      ),
    );
  }
}
