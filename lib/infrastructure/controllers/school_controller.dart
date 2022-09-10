import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_profile/index.dart';

class SchoolController extends GetxController {
  static SchoolController instance = Get.find();
  bool isSchoolLocationChosen = false;

  final _activeIndex = 1.obs;

  final _isUsingSearch = false.obs;

  // boolean for filter conditions
  final _isName = true.obs;
  final _isLocation = true.obs;
  final _isCategory = false.obs;
  final _isLevel = false.obs;
  final _isFeeRange = false.obs;
  final _isRegion = false.obs;
  final _isTown = false.obs;
  final _isRating = false.obs;
  final _isPopular = false.obs;

  void changeIsUsingSearch(bool value) {
    _isUsingSearch.value = value;
  }

  void handleSortBy({required int index}) {
    // set all booleans to false
    _isName.value = false;
    _isLocation.value = false;
    _isCategory.value = false;
    _isLevel.value = false;
    _isFeeRange.value = false;
    _isRegion.value = false;
    _isTown.value = false;
    _isRating.value = false;
    _isPopular.value = false;
    // set the boolean at the index to true
    switch (index) {
      case 1:
        _isName.value = true;
        break;
      case 2:
        _isLocation.value = true;
        break;
      case 3:
        _isCategory.value = true;
        break;
      case 4:
        _isLevel.value = true;
        break;
      case 5:
        _isFeeRange.value = true;
        break;
      case 6:
        _isRegion.value = true;
        break;
      case 7:
        _isRating.value = true;
        break;
      case 8:
        _isRating.value = true;
        break;
      case 9:
        _isPopular.value = true;
        break;
      default:
        _isName.value = true;
        break;
    }
    sortBy();
  }

  // files
  List<XFile>? images;
  List<File>? imageFiles;
  XFile? avatar;
  File? avatarImage;
  // create a list of all schools
  final allSchools = <SchoolModel>[].obs;
  final allReviews = <ReviewModel>[].obs;
  List<Prediction> addressPointList = []; // list of address points
  final _filteredSchoolList = <SchoolModel>[].obs; // list of address points
  late Address _addressPoint;
  // school model to upload
  SchoolModel schoolModelToDatabase = SchoolModel();
  ReviewModel reviewModelForDatabase = ReviewModel();
  LikesModel likesModelForDatabase = LikesModel();

  // add school to all schools
  void addSchool(SchoolModel? school) {
    allSchools.add(school!);
  }

  // add all schools list
  void addAllSchools(List<SchoolModel> schools) {
    // first clear all the schools
    allSchools.clear();
    _filteredSchoolList.clear();
    // debugPrint("schools before: ${allSchools.length}");
    allSchools.addAll(schools);
    // debugPrint("schools after: ${allSchools.length}");
    filterSchools(""); // filter schools with nothing
    handleSortBy(index: 0);
  }

  void addAllReviews(List<ReviewModel> reviews) {
    // first clear all the schools
    allSchools.clear();
    _filteredSchoolList.clear();
    // debugPrint("schools before: ${allSchools.length}");
    allSchools.addAll(schools);
    // debugPrint("schools after: ${allSchools.length}");
  }

  // update destination address
  void updateAddressPoint(Address mapAddress) {
    _addressPoint = mapAddress;
    // set the school map address controller text to the address point name
    mapAddressController.text = _addressPoint.placeName!;
    searchAddressController.clear();
    searchAddressController.text = _addressPoint.placeName!;
    addressPointList.clear();
    isSchoolLocationChosen = true;
  }

  // update search school controller
  void updateSearchSchool(String string) {
    searchSchoolController.clear();
    searchSchoolController.text = string;
  }

  // clear address point
  void clearAddressPoint() {
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
  void updateSchoolModelImages(List<dynamic> images) {
    schoolModelToDatabase.images = images;
  }

  // update school avatar image
  void updateSchoolModelAvatarImage(String avatarImage) {
    schoolModelToDatabase.avatar = avatarImage;
  }

  // reset the list of filtered schools
  void clearFilteredSchools() {
    _filteredSchoolList.value = [];
  }

  // filter with boolean
  void sortBy() {
    clearFilteredSchools();
    allSchools.where((school) {
      _filteredSchoolList.add(school);
      // if isName is true, add to the list of filtered schools in alphabetical order by name
      if (_isName.value) {
        _filteredSchoolList.sort((a, b) => a.name!.compareTo(b.name!));
      }
      if (_isLocation.value) {
        _filteredSchoolList.sort((a, b) => a.mapAddress!.placeName!.compareTo(b.mapAddress!.placeName!));
      }
      if (_isCategory.value) {
        _filteredSchoolList.sort((a, b) => a.category!.compareTo(b.category!));
      }
      if (_isLevel.value) {
        _filteredSchoolList.sort((a, b) => a.level!.compareTo(b.level!));
      }
      if (_isFeeRange.value) {
        _filteredSchoolList.sort((a, b) => a.feeRange!.compareTo(b.feeRange!));
      }
      if (_isRegion.value) {
        _filteredSchoolList.sort((a, b) => a.region!.compareTo(b.region!));
      }
      if (_isTown.value) {
        _filteredSchoolList.sort((a, b) => a.town!.compareTo(b.town!));
      }
      if (_isRating.value) {
        _filteredSchoolList.sort((a, b) => a.rating!.compareTo(b.rating!));
      }
      if (_isPopular.value) {
        _filteredSchoolList.sort((a, b) => a.likes!.length.compareTo(b.likes!.length));
      }
      return true;
    }).toList();
  }

  // filter the list of schools based on a search string
  void filterSchools(String searchString) {
    clearFilteredSchools();
    allSchools.where((school) {
      if (school.name!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.category!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.region!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.district!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.slogan!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.category!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.address!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.level!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.feeRange!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.feeRange!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.mapAddress!.placeName!.toLowerCase().contains(searchString.toLowerCase()) ||
          school.town!.toLowerCase().contains(searchString.toLowerCase())) {
        // add the school to the filtered list
        debugPrint("found an item $searchString");
        _filteredSchoolList.add(school);
      } else {
        debugPrint("no item found an item $searchString");
      }
      // filter the list and return the school
      return true;
    }).toList();
  }

  // getters
  bool get isName => _isName.value;
  bool get isLocation => _isLocation.value;
  bool get isCategory => _isCategory.value;
  bool get isLevel => _isLevel.value;
  bool get isFeeRange => _isFeeRange.value;
  bool get isRegion => _isRegion.value;
  bool get isTown => _isRegion.value;
  bool get isRating => _isRating.value;
  bool get isPopular => _isPopular.value;
  bool get isUsingSearch => _isUsingSearch.value;
  int get activeIndex => _activeIndex.value;
  List<SchoolModel> get schools => allSchools;
  List<ReviewModel> get reviews => allReviews;
  List<SchoolModel> get filteredSchoolList => _filteredSchoolList;
  Address get addressPoint => _addressPoint;
}
