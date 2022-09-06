import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class ReviewRepo {
  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;

  ReviewModel? reviewModel;

  // add review to collection
  Future<Either<Failure, ReviewModel>> addReviewToCollection({
    required ReviewModel reviewData,
  }) async {
    try {
      // create a new document on firebase
      _firebaseCaller.addDataToCollection(
        path: FirestorePaths.reviewsCollections,
        data: reviewData.toMap(),
      );
      reviewModel = reviewData;
      return Right(reviewData);
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
  Stream<List<ReviewModel>> subscribeToReviews() {
    return _firebaseCaller.collectionStream(
      path: FirestorePaths.reviewsCollections,
      builder: (Map<String, dynamic>? data, String documentId) {
        if (data != null) {
          // create a user map and add the doc id
          Map<String, dynamic> reviewMap = {
            'uid': documentId,
            ...data,
          };
          // create a user model from the map
          return ReviewModel.fromJson(reviewMap);
        }
        return ReviewModel();
      },
    );
  }

  // update review
  Future<Either<Failure, ReviewModel>> updateReview({
    required ReviewModel reviewData,
  }) async {
    try {
      // update the document on firebase
      _firebaseCaller.updateData(
        path: FirestorePaths.reviewsDocument(id: reviewData.id!),
        data: reviewData.toMap(),
      );
      reviewModel = reviewData;
      return Right(reviewData);
    } on FirebaseAuthException catch (e) {
      final errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: errorMessage));
    }
  }

  // delete review
  Future<Either<Failure, bool>> deleteReview({
    required String reviewId,
  }) async {
    try {
      // delete the document on firebase
      _firebaseCaller.deleteData(
        path: FirestorePaths.reviewsDocument(id: reviewId),
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

  // get a review
  Future<ReviewModel?> getReview({
    required String reviewId,
  }) async {
    try {
      // get the document on firebase
      final reviewData = await _firebaseCaller.getData(
        path: FirestorePaths.reviewsDocument(id: reviewId),
        builder: (Map<String, dynamic>? data, String? documentId) {
          if (data != null) {
            // create a user map and add the doc id
            Map<String, dynamic> reviewMap = {
              'uid': documentId,
              ...data,
            };
            // create a user model from the map
            return ReviewModel.fromJson(reviewMap);
          }
          return ReviewModel();
        },
      );
      return reviewData;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
