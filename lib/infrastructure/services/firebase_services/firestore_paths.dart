class FirestorePaths {
  // User
  static String get userCollection => 'users';

  // reviews path
  static String get reviewsCollections => 'reviews';
  static String reviewsDocument({required String id}) => 'reviews/$id';

  // user document
  static String userDocument(String docId) => 'users/$docId';

  // user profile image path
  static String profilesImagesPath(String docId) => 'users/$docId/profile_image';

  // user review document
  static String userHistoryDocument(String docId) => 'users/$docId/reviews';

  // admins
  static String get adminsCollection => 'admins';
  static String adminsDocument({required String id}) => 'admins/$id';

  // schools
  static String get schoolsCollection => 'schools';
  static String schoolsDocument({required String id}) => 'schools/$id';
}
