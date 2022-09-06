import 'dart:io';

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

  /*
  * #############################################################
  * ################ Schools callers and functions ##############
  * #############################################################
  * */
  // add a new school
  static Future<bool> addNewSchool({
    required SchoolModel schoolModel,
  }) async {
    // debugPrint("school model ${schoolModel.toJson()}");
    Either<Failure, SchoolModel> response = await schoolRepo.setSchoolDataToFirebase(schoolData: schoolModel);
    // debugPrint('school data: $response');
    if (response.isRight()) {
      // update the school id on firestore
      Either<Failure, SchoolModel> updateSchool = await schoolRepo.updateSchoolData(
        schoolData: response.getOrElse(() => SchoolModel()),
      );
      if (updateSchool.isRight()) {
        updateSchool.fold(
          (error) => debugPrint(error.toString()),
          (schoolData) {
            debugPrint("school added ${schoolData.toJson()}");
          },
        );
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // subscribe to schools
  static Stream<List<SchoolModel?>> subscribeToSchools() {
    return schoolRepo.subscribeToSchools();
  }

  // get all schools
  static void getAllSchools() async {
    Stream<List<SchoolModel?>> allSchools = subscribeToSchools();
    List<SchoolModel> _schools = [];
    // get the snapshot data from all schools
    allSchools.listen((List<SchoolModel?> schools) {
      // debugPrint("all schools: $schools");
      if (schools.isNotEmpty) {
        // loop through the schools and add to the schools list
        for (SchoolModel? school in schools) {
          if (school != null) {
            _schools.add(school);
          }
        }
      }
      debugPrint("schools: $_schools");
      schoolController.addAllSchools(_schools);
    });
  }

  // update a school
  static Future<bool> updateSchool({
    required SchoolModel schoolModel,
  }) async {
    Either<Failure, SchoolModel> response = await schoolRepo.updateSchoolData(schoolData: schoolModel);
    // debugPrint('data: $response');
    if (response.isRight()) {
      response.fold(
        (error) => debugPrint(error.toString()),
        (schoolModel) => debugPrint("school updated ${schoolModel.toJson()}"),
      );
      return true;
    } else {
      return false;
    }
  }

  // get a school by id
  static Future<Either<Failure, SchoolModel>> getSchoolById({
    required String schoolId,
  }) async {
    SchoolModel? schoolModel = await schoolRepo.getSchoolDataFromFirebase(schoolId: schoolId);
    // debugPrint('data: $schoolModel');
    if (schoolModel != null) {
      return Right(schoolModel);
    } else {
      return const Left(ServerFailure(message: "There was no school found with this id"));
    }
  }

  // delete a school by id
  static Future<bool> deleteSchoolById({
    required String schoolId,
  }) async {
    Either<Failure, bool> response = await schoolRepo.deleteSchoolData(schoolId: schoolId);
    // debugPrint('data: $response');
    if (response.isRight()) {
      response.fold(
        (error) => debugPrint(error.toString()),
        (isDeleted) => debugPrint("school deleted $isDeleted"),
      );
      return true;
    } else {
      return false;
    }
  }

  /*
  * ############################################################
  * ################## Reviews #################################
  * ############################################################
  * */
  // add a new review
  static Future<bool> addNewReview({
    required ReviewModel reviewModel,
  }) async {
    Either<Failure, ReviewModel> response = await reviewRepo.addReviewToCollection(reviewData: reviewModel);
    // debugPrint('data: $response');
    if (response.isRight()) {
      response.fold(
        (error) => debugPrint(error.toString()),
        (reviewModel) => debugPrint("review added ${reviewModel.toJson()}"),
      );
      return true;
    } else {
      return false;
    }
  }

  // subscribe to reviews
  static Stream<List<ReviewModel>> subscribeToReviews() {
    return reviewRepo.subscribeToReviews();
  }

  // update a review
  static Future<bool> updateReview({
    required ReviewModel reviewModel,
  }) async {
    Either<Failure, ReviewModel> response = await reviewRepo.updateReview(reviewData: reviewModel);
    // debugPrint('data: $response');
    if (response.isRight()) {
      response.fold(
        (error) => debugPrint(error.toString()),
        (reviewModel) => debugPrint("review updated ${reviewModel.toJson()}"),
      );
      return true;
    } else {
      return false;
    }
  }

  // delete a review
  static Future<bool> deleteReview({
    required String reviewId,
  }) async {
    Either<Failure, bool> response = await reviewRepo.deleteReview(reviewId: reviewId);
    // debugPrint('data: $response');
    if (response.isRight()) {
      response.fold(
        (error) => debugPrint(error.toString()),
        (isDeleted) => debugPrint("review deleted $isDeleted"),
      );
      return true;
    } else {
      return false;
    }
  }

  // get a review by id
  static Future<Either<Failure, ReviewModel>> getReviewById({
    required String reviewId,
  }) async {
    ReviewModel? reviewModel = await reviewRepo.getReview(reviewId: reviewId);
    // debugPrint('data: $reviewModel');
    if (reviewModel != null) {
      return Right(reviewModel);
    } else {
      return const Left(ServerFailure(message: "There was no review found with this id"));
    }
  }

  /*
  * #############################################################
  * ############# files upload ##################################
  * #############################################################
  * */
  // upload a file
  static Future<String> uploadFile({
    required File file,
  }) async {
    String? url = await firebaseStorageRepo.uploadImage(imageFile: file);
    // debugPrint('data: $url');
    return url;
  }

  // upload list of files
  static Future<List<String>> uploadFiles({
    required List<File> files,
  }) async {
    List<String>? urls = await firebaseStorageRepo.uploadImages(imageFiles: files);
    // debugPrint('data: $urls');
    return urls;
  }

  // get a file
  static Future<String> getFile({
    required String url,
  }) async {
    String? file = await firebaseStorageRepo.getImageUrl(fileName: url);
    // debugPrint('data: $file');
    return file;
  }

  // delete image
  static Future<bool> deleteImage({
    required String url,
  }) async {
    bool? isDeleted = await firebaseStorageRepo.deleteImage(fileName: url);
    // debugPrint('data: $isDeleted');
    return isDeleted;
  }
}
