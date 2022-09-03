import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class HelperMethods {
  HelperMethods._();
  // create an instance of the class
  static final HelperMethods instance = HelperMethods._();

  // login user using auth repo
  static Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    Either<Failure, UserModel> response = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // debugPrint("email $email, password $password");
    // debugPrint('data: $response');
    if (response.isRight()) {
      response.fold(
        (error) => debugPrint(error.toString()),
        (userModel) => userController.updateCurrentUserInfo(userModel),
      );
      return true;
    } else {
      return false;
    }
  }

  // register user using auth repo
  static Future<bool> registerUser({
    required String email,
    required String password,
    required String name,
    required bool isAdmin,
  }) async {
    Either<Failure, UserModel> response = await authRepo.registerWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      isAdmin: isAdmin,
    );
    // debugPrint('data: $response');
    if (response.isRight()) {
      response.fold(
        (error) => debugPrint(error.toString()),
        (userModel) => userController.updateCurrentUserInfo(userModel),
      );
      return true;
    } else {
      return false;
    }
  }

  // get uer info using auth repo
  static Future<bool> getUserInfo() async {
    UserModel? userModel = await userRepo.getUserDataFromFirebase(userController.currentFirebaseUser.uid);
    debugPrint('data: $userModel');
    if (userModel != null) {
      userController.updateCurrentUserInfo(userModel);
      return true;
    } else {
      return false;
    }
  }
}
