class APIEndpoints {
  static String baseUrl = "https://gorest.co.in/public/v2/";
  static String token =
      "090a4d13b368ea5cbc5c1f05cd08a2b0cb5cd4234b51f1b2aa2a8e6a4edaf183"; //TODO change to env

  static String get userList => 'users?';
  static String get createUser => 'users';
  static String get rudUsers => 'users/';
}
