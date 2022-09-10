import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:school_profile/index.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // sign in with email and password
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // debug print userCredential
      debugPrint(userCredential.toString());
      final User? user = userCredential.user;
      UserModel? userModel = await userRepo.getUserDataFromFirebase(user!.uid);
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {}
      });
      return Right(userModel!);
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  // register with email and password
  Future<Either<Failure, UserModel>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required bool isAdmin,
    String? profile = '',
  }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // debug print the credential
      // debugPrint(userCredential.toString());
      final User? user = userCredential.user;
      UserModel? userData = UserModel(
        uid: user!.uid,
        name: name,
        email: email,
        profile: profile,
        isAdmin: isAdmin,
        favorites: [],
        searchHistory: [],
      );
      // debugPrint('user data: ${userData.isAdmin.toString()}');
      // save user data to firebase
      await userRepo.setUserDataToFirebase(userData);
      UserModel? userInfo = await userRepo.getUserDataFromFirebase(user.uid);
      // debugPrint('user info: ${userInfo?.isAdmin.toString()}');
      return Right(userInfo!);
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      userController.initUser();
      HelperMethods.getAllSchools();
      HelperMethods.getAllReviews();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
