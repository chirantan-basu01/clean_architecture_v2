import 'package:educare_erp/core/utils/helper/app_fontSize.dart';
import 'package:educare_erp/features/test/screens/test_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const kSplash = "/";

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case kSplash:
        return MaterialPageRoute(builder: (_) => TestScreen());

      default:
        return _errorRoute(errorMessage: "Route not found: ${settings.name}");
    }
  }

  static Route<dynamic> _errorRoute({
    String errorMessage = '',
  }) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Error",
            style: Theme.of(_)
                .textTheme
                .displayMedium
                ?.copyWith(color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Oops something went wrong",
                style: Theme.of(_).textTheme.displayMedium?.copyWith(
                    fontSize: AppFontSize.textExtraLarge, color: Colors.black),
              ),
              Text(
                errorMessage,
                style: Theme.of(_).textTheme.displayMedium?.copyWith(
                    fontSize: AppFontSize.textExtraLarge, color: Colors.black),
              ),
            ],
          ),
        ),
      );
    });
  }
}
