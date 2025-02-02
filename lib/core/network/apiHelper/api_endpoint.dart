class ApiEndPoint {
  static final ApiEndPoint _instance = ApiEndPoint._internal();

  factory ApiEndPoint() {
    return _instance;
  }

  ApiEndPoint._internal();

  static const baseurl = "https://anjanshastri.com";

  // for example
  static const login = "$baseurl/login";
  static const test = "$baseurl/api/galleries";
  static const test1 = "$baseurl/api/chambers";
}
