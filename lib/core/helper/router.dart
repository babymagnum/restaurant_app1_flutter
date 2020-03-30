import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:dribbble_clone/view/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static const String initialRoute = OnboardingView.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => HomeView());
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
