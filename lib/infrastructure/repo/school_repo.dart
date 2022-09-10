import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class SchoolRepo {
  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;

  SchoolModel? schoolModel;

  // set school data to firebase
  Future<Either<Failure, SchoolModel>> setSchoolDataToFirebase({
    required SchoolModel schoolData,
  }) async {
    try {
      // create a new document on firebase
      var response = await _firebaseCaller.addDataToCollection(
        path: FirestorePaths.schoolsCollection,
        data: schoolData.toMap(),
      );
      // debugPrint("school data to firestore: $response");

      // update the school id
      schoolData = schoolData.copyWith(id: response);

      schoolModel = schoolData;
      return Right(schoolData);
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  // subscribe to collection
  Stream<List<SchoolModel?>> subscribeToSchools() {
    return _firebaseCaller.collectionStream(
      path: FirestorePaths.schoolsCollection,
      builder: (Map<String, dynamic>? data, String documentId) {
        if (data != null) {
          // create an Address for the school map address
          // debugPrint("school data from firestore: $data");
          Address? mapAddress;
          if (data['mapAddress'] != null) {
            mapAddress = Address.fromMap(data['mapAddress']);
          }
          // create a user map and add the doc id
          Map<dynamic, dynamic> schoolMap = {
            'uid': documentId,
            'mapAddress': mapAddress,
            ...data,
          };
          return SchoolModel.fromJson(schoolMap);
        }
        return null;
      },
    );
  }

  // delete school field value
  Future<Either<Failure, bool>> deleteSchoolFieldValue({
    required String schoolId,
    required String likesField,
  }) async {
    try {
      // delete the field value
      await _firebaseCaller.deleteFieldValue(
        path: FirestorePaths.schoolsDocument(id: schoolId),
        field: likesField,
      );
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  // update school data
  Future<Either<Failure, SchoolModel>> updateSchoolData({
    required SchoolModel schoolData,
  }) async {
    try {
      // update the document on firebase
      _firebaseCaller.updateData(
        path: FirestorePaths.schoolsDocument(id: schoolData.id!),
        data: schoolData.toMap(),
      );
      schoolModel = schoolData;
      return Right(schoolData);
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  // delete school data from firebase
  Future<Either<Failure, bool>> deleteSchoolData({
    required String schoolId,
  }) async {
    try {
      // delete the document on firebase
      _firebaseCaller.deleteData(
        path: FirestorePaths.schoolsDocument(id: schoolId),
      );
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  // get a school document from firebase
  Future<SchoolModel?> getSchoolDataFromFirebase({required String schoolId}) async {
    return await _firebaseCaller.getData(
      path: FirestorePaths.schoolsDocument(id: schoolId),
      builder: (data, docId) {
        if (data != null) {
          // create an Address for the school map address
          Address? mapAddress;
          LikesModel? mapLikes;
          if (data['mapAddress'] != null) {
            mapAddress = Address.fromMap(data['mapAddress']);
          }
          if (data['likes'] != null || data['likes'] != []) {
            mapLikes = LikesModel.fromJson(data['likes']);
          }
          // create a user map and add the doc id
          Map<dynamic, dynamic> schoolMap = {
            'uid': docId,
            'mapAddress': mapAddress,
            'likes': mapLikes,
            ...data,
          };
          // create a user model from the map
          return SchoolModel.fromJson(schoolMap);
        }
        return null;
      },
    );
  }
}
