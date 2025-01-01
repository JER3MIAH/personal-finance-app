import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // void navigateToOnboardingScreen() {
    //   AppNavigator(context).replaceAllNamed(HomeRoutes.main);
    // }

    return Scaffold(
      body: Center(
        child: AppText('Splash Screen'),
      ),
    );
  }
}
