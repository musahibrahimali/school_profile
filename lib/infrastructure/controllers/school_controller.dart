import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_profile/index.dart';

class SchoolController extends GetxController {
  static SchoolController instance = Get.find();
  bool isSchoolLocationChosen = false;
  // files
  List<XFile>? images;
  List<File>? imageFiles;
  XFile? avatar;
  File? avatarImage;
  // create a list of all schools
  final allSchools = <SchoolModel>[].obs;
  List<Prediction> addressPointList = []; // list of address points
  late Address _addressPoint;
  // school model to upload
  SchoolModel schoolModelToDatabase = SchoolModel();
  ReviewModel reviewModelForDatabase = ReviewModel();
  LikesModel likesModelForDatabase = LikesModel();
  // search place controller
  TextEditingController searchAddressController = TextEditingController();
  TextEditingController searchSchoolController = TextEditingController();
  // review text editing controller
  TextEditingController reviewUserIdController = TextEditingController();
  TextEditingController reviewContentController = TextEditingController();
  TextEditingController reviewSchoolController = TextEditingController();
  TextEditingController reviewDateController = TextEditingController();

  // text editing controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController headTeacherController = TextEditingController();
  final TextEditingController mapAddressController = TextEditingController();
  final TextEditingController yearOfEstablishmentController = TextEditingController();
  final TextEditingController sloganController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController studentsPopulationController = TextEditingController();
  final TextEditingController teachersPopulationController = TextEditingController();
  final TextEditingController extraCurricularController = TextEditingController();
  final TextEditingController nonTeachingStaffPopulationController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController awardsController = TextEditingController();
  final TextEditingController historyController = TextEditingController();
  final TextEditingController facilitiesController = TextEditingController();
  final TextEditingController performanceController = TextEditingController();
  final TextEditingController feeRangeController = TextEditingController();
  final TextEditingController schoolEmailController = TextEditingController();
  final TextEditingController schoolPhoneNumberController = TextEditingController();

  // add school to all schools
  void addSchool(SchoolModel? school) {
    allSchools.add(school!);
  }

  // add all schools list
  void addAllSchools(List<SchoolModel> schools) {
    // first clear all the schools
    allSchools.clear();
    debugPrint("schools before: ${allSchools.length}");
    allSchools.addAll(schools);
    debugPrint("schools after: ${allSchools.length}");
  }

  // update destination address
  updateAddressPoint(Address mapAddress) {
    _addressPoint = mapAddress;
    // set the school map address controller text to the address point name
    mapAddressController.text = _addressPoint.placeName!;
    searchAddressController.clear();
    searchAddressController.text = _addressPoint.placeName!;
    addressPointList.clear();
    isSchoolLocationChosen = true;
  }

  // update search school controller
  updateSearchSchool(String string) {
    searchSchoolController.clear();
    searchSchoolController.text = string;
  }

  // clear address point
  clearAddressPoint() {
    _addressPoint = Address();
    mapAddressController.clear();
    searchAddressController.clear();
    addressPointList.clear();
    isSchoolLocationChosen = false;
  }

  // update school model to database
  void updateSchoolModelToDatabase() {
    schoolModelToDatabase.name = nameController.text;
    schoolModelToDatabase.emailAddress = schoolEmailController.text;
    schoolModelToDatabase.phoneNumber = schoolPhoneNumberController.text;
    schoolModelToDatabase.address = addressController.text;
    schoolModelToDatabase.extraCurricular = extraCurricularController.text;
    schoolModelToDatabase.category = categoryController.text;
    schoolModelToDatabase.nameOfHeadTeacher = headTeacherController.text;
    schoolModelToDatabase.yearOfEstablishment = yearOfEstablishmentController.text;
    schoolModelToDatabase.slogan = sloganController.text;
    schoolModelToDatabase.region = regionController.text;
    schoolModelToDatabase.town = townController.text;
    schoolModelToDatabase.district = districtController.text;
    schoolModelToDatabase.feeRange = feeRangeController.text;
    schoolModelToDatabase.studentsPopulation = studentsPopulationController.text;
    schoolModelToDatabase.teachersPopulation = teachersPopulationController.text;
    schoolModelToDatabase.nonTeachingStaffPopulation = nonTeachingStaffPopulationController.text;
    schoolModelToDatabase.rating = ratingController.text;
    schoolModelToDatabase.awards = awardsController.text;
    schoolModelToDatabase.history = historyController.text;
    schoolModelToDatabase.facilities = facilitiesController.text;
    schoolModelToDatabase.performance = performanceController.text;
    schoolModelToDatabase.level = levelController.text;
    schoolModelToDatabase.mapAddress = _addressPoint;
  }

  // update review model to database
  void updateReviewModelToDatabase() {
    reviewModelForDatabase.userId = reviewUserIdController.text;
    reviewModelForDatabase.review = reviewContentController.text;
    reviewModelForDatabase.schoolId = reviewSchoolController.text;
    reviewModelForDatabase.date = reviewDateController.text;
  }

  // update likes model for database
  void updateLikesModelForDatabase({required String userId, required String schoolId}) {
    likesModelForDatabase.userId = userId;
    likesModelForDatabase.schoolId = schoolId;
  }

  // update avatar
  void updateAvatar(XFile? image) {
    avatar = image;
    // convert to file
    avatarImage = File(avatar!.path);
  }

  // add image to images
  void addImage(XFile? image) {
    images!.add(image!);
    // convert the image to file and add to imageFiles
    imageFiles!.add(File(image.path));
  }

  // add all images
  void addAllImages(List<XFile>? images) {
    this.images = images;
    // convert the images to files and add to imageFiles
    imageFiles = images!.map((image) => File(image.path)).toList();
  }

  // remove image
  void removeImage(int index) {
    images!.removeAt(index);
    imageFiles!.removeAt(index);
  }

  // clear avatar
  void clearAvatar() {
    avatar = null;
    avatarImage = null;
  }

  // reset school controller to default
  void resetSchoolController() {
    // clear all text editing controllers
    nameController.clear();
    categoryController.clear();
    addressController.clear();
    headTeacherController.clear();
    mapAddressController.clear();
    yearOfEstablishmentController.clear();
    sloganController.clear();
    regionController.clear();
    districtController.clear();
    townController.clear();
    studentsPopulationController.clear();
    teachersPopulationController.clear();
    extraCurricularController.clear();
    nonTeachingStaffPopulationController.clear();
    ratingController.clear();
    awardsController.clear();
    historyController.clear();
    facilitiesController.clear();
    performanceController.clear();
    feeRangeController.clear();
    schoolEmailController.clear();
    schoolPhoneNumberController.clear();
    // clear all images
    images = null;
    avatarImage = null;
    clearAvatar();
  }

  // update school model images
  updateSchoolModelImages(List<dynamic> images) {
    schoolModelToDatabase.images = images;
  }

  // update school avatar image
  updateSchoolModelAvatarImage(String avatarImage) {
    schoolModelToDatabase.avatar = avatarImage;
  }

  // getter for all schools
  List<SchoolModel> get schools => allSchools;
  Address get addressPoint => _addressPoint;
}
