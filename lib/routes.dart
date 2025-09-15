import 'package:flutter/material.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  late Widget screen;

  if (settings.name == LoginView.name) {
    screen = LoginView();
  } else if (settings.name == SignupView.name) {
    screen = SignupView();
  }

  return MaterialPageRoute(builder: (ctx) => screen);
}
