import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class AdminAuthScreen extends StatefulWidget {
  static const String id = 'admin_auth_screen';
  const AdminAuthScreen({Key? key}) : super(key: key);

  @override
  State<AdminAuthScreen> createState() => _AdminAuthScreenState();
}

class _AdminAuthScreenState extends State<AdminAuthScreen> {
  bool changePage = false;

  // change the page
  void _changePage() {
    setState(() {
      changePage = !changePage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: (!userController.isUserLoggedIn || (userController.currentUserInfo.isAdmin == null || userController.currentUserInfo.isAdmin == false))
          ? SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.carouselCarouselImage4),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // login page
                  !changePage
                      ? Positioned(
                          child: Center(
                            child: AdminLoginCard(
                              onPageChange: _changePage,
                            ),
                          ),
                        )
                      : Positioned(
                          child: Center(
                            child: AdminRegisterCard(
                              onPageChange: _changePage,
                            ),
                          ),
                        ),
                ],
              ),
            )
          : const AdminProfilePage(),
    );
  }
}
