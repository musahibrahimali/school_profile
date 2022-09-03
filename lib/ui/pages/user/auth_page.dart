import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class AuthPage extends StatefulWidget {
  static const String id = "auth_page";
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
      body: !userController.isUserLoggedIn
          ? SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.carouselCarouselImage7),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // login page
                  !changePage
                      ? Positioned(
                          child: Center(
                            child: LoginCard(
                              onPageChange: _changePage,
                            ),
                          ),
                        )
                      : Positioned(
                          child: Center(
                            child: RegisterCard(
                              onPageChange: _changePage,
                            ),
                          ),
                        ),
                ],
              ),
            )
          : const UserProfilePage(),
    );
  }
}
