class FirestorePaths {
  // User
  static String get userCollection => 'users';

  // reviews path
  static String get rideRequestCollections => 'reviews';

  // user document
  static String userDocument(String docId) => 'users/$docId';

  // user profile image path
  static String profilesImagesPath(String docId) => 'users/$docId/profile_image';

  // user review document
  static String userHistoryDocument(String docId) => 'users/$docId/reviews';

  // admins
  static String get adminsCollection => 'admins';

  // schools
  static String get schoolsCollection => 'schools';
}
