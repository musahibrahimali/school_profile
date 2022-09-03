import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:school_profile/index.dart';

class UserRepo {
  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;

  String? uid;
  UserModel? userModel;

  // set user data
  Future<Either<Failure, UserModel>> setUserDataToFirebase(
    UserModel userData,
  ) async {
    try {
      final firebaseStoredUser = await getUserDataFromFirebase(userData.uid!);
      if (firebaseStoredUser == null) {
        _firebaseCaller.setData(
          path: FirestorePaths.userDocument(userData.uid!),
          data: userData.toMap(),
        );
        userModel = userData;
        return Right(userData);
      } else {
        return Right(firebaseStoredUser);
      }
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  // check if user document exists
  Future<bool> checkUserData(String uid) async {
    await _firebaseCaller.getData(
      path: FirestorePaths.userDocument(uid),
      builder: (data, docId) {
        if (data != null) {
          return true;
        }
        return false;
      },
    );
    return false;
  }

  // get user data from firebase
  Future<UserModel?> getUserDataFromFirebase(String userId) async {
    return await _firebaseCaller.getData(
      path: FirestorePaths.userDocument(userId),
      builder: (data, docId) {
        if (data != null) {
          // create a user map and add the doc id
          Map<String, dynamic> userMap = {
            'uid': docId,
            ...data,
          };
          debugPrint('userMap: $userMap');
          userModel = UserModel.fromMap(userMap);
          return userModel!;
        }
        return null;
      },
    );
  }

  // update user
  Future updateUser(UserModel userData) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: userData.toMap(),
      merge: true,
    );
    userModel = userData;
  }

  // change first name
  Future updateFirstName({required String name}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: {"name": name},
      merge: true,
    );
    userModel = userModel!.copyWith(name: name);
  }

  // update the search history
  Future updateSearchHistory({required String searchHistory}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      // add the search history to the list
      data: {
        "searchHistory": FieldValue.arrayUnion([searchHistory])
      },
      merge: true,
    );
    // add the search history to the existing list
    List<dynamic>? searchHistoryList = userModel!.searchHistory;
    searchHistoryList!.add(searchHistory);
    userModel = userModel!.copyWith(searchHistory: searchHistoryList);
  }

  // update user favorite
  Future updateUserFavorite({required String schoolId}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      // add the school id to the list
      data: {
        "favorites": FieldValue.arrayUnion([schoolId])
      },
      merge: true,
    );
    // add the school id to the existing list
    List<dynamic>? favoritesList = userModel!.favorites;
    favoritesList!.add(schoolId);
    userModel = userModel!.copyWith(favorites: favoritesList);
  }

  // update user profile picture
  Future updateUserImage({required File? imageFile}) async {
    String? picUrl = await _firebaseCaller.uploadImage(
      path: FirestorePaths.profilesImagesPath(userModel!.uid!),
      file: imageFile!,
    );
    if (picUrl != null) {
      await _firebaseCaller.setData(
        path: FirestorePaths.userDocument(uid!),
        data: {"profile": picUrl},
        merge: true,
      );
      userModel = userModel!.copyWith(profile: picUrl);
    }
  }

  // delete user data
  Future clearUserLocalData() async {
    uid = null;
    userModel = null;
  }
}
