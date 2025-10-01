import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/routes.dart';
import 'package:twitter_clone/theme/app_theme.dart';

import 'features/auth/view/signup_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: SignupView(),
      // initialRoute: SignupView.name,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
