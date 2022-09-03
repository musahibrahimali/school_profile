import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class SchoolController extends GetxController {
  static SchoolController instance = Get.find();
  // create a list of all schools
  var allSchools = <SchoolModel>[].obs;
  // school model to upload
  SchoolModel schoolModelToDatabase = SchoolModel();
  ReviewModel reviewModelForDatabase = ReviewModel();
  // review text editing controller
  TextEditingController reviewUserIdController = TextEditingController();
  TextEditingController reviewContentController = TextEditingController();
  TextEditingController reviewSchoolController = TextEditingController();
  TextEditingController reviewDateController = TextEditingController();

  // text editing controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController headTeacherController = TextEditingController();
  final TextEditingController mapAddressController = TextEditingController();
  final TextEditingController yearOfEstablishmentController = TextEditingController();
  final TextEditingController sloganController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController studentsPopulationController = TextEditingController();
  final TextEditingController teachersPopulationController = TextEditingController();
  final TextEditingController nonTeachingStaffPopulationController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController awardsController = TextEditingController();
  final TextEditingController historyController = TextEditingController();
  final TextEditingController facilitiesController = TextEditingController();
  final TextEditingController performanceController = TextEditingController();
  final TextEditingController schoolEmailController = TextEditingController();
  final TextEditingController schoolPhoneNumberController = TextEditingController();

  // add school to all schools
  void addSchool(SchoolModel school) {
    allSchools.add(school);
  }

  // update school model to database
  void updateSchoolModelToDatabase() {
    schoolModelToDatabase.name = nameController.text;
    schoolModelToDatabase.emailAddress = schoolEmailController.text;
    schoolModelToDatabase.phoneNumber = schoolPhoneNumberController.text;
    schoolModelToDatabase.address = addressController.text;
    schoolModelToDatabase.mapAddress = mapAddressController.text;
    schoolModelToDatabase.nameOfHeadTeacher = headTeacherController.text;
    schoolModelToDatabase.yearOfEstablishment = yearOfEstablishmentController.text;
    schoolModelToDatabase.slogan = sloganController.text;
    schoolModelToDatabase.region = regionController.text;
    schoolModelToDatabase.district = districtController.text;
    schoolModelToDatabase.studentsPopulation = studentsPopulationController.text;
    schoolModelToDatabase.teachersPopulation = teachersPopulationController.text;
    schoolModelToDatabase.nonTeachingStaffPopulation = nonTeachingStaffPopulationController.text;
    schoolModelToDatabase.rating = ratingController.text;
    schoolModelToDatabase.awards = awardsController.text;
    schoolModelToDatabase.history = historyController.text;
    schoolModelToDatabase.facilities = facilitiesController.text;
    schoolModelToDatabase.performance = performanceController.text;
  }

  // update review model to database
  void updateReviewModelToDatabase() {
    reviewModelForDatabase.userId = reviewUserIdController.text;
    reviewModelForDatabase.review = reviewContentController.text;
    reviewModelForDatabase.schoolId = reviewSchoolController.text;
    reviewModelForDatabase.date = reviewDateController.text;
  }

  // getter for all schools
  List<SchoolModel> get schools => allSchools;
}
