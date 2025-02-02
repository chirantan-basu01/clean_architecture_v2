class AppStrings{
  static final AppStrings _instance = AppStrings._internal();

  factory AppStrings(){
    return _instance;
  }

  AppStrings._internal();

  //network repository
  static String somethingWentWrong = "Something went wrong";
  static String authError = "Unauthorized";
  static String checkInternet = "Check your internet connection";
}