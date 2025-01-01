import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/features/home/presentation/screens/screens.dart';
import 'package:personal_finance_app/src/features/splash/splash_screen.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  ...splashRoutes,
  ...homeRoutes,
  ...transactionsRoutes,
  ...budgetRoutes,
  ...potsRoutes,
  ...reuccuringBillsRoutes,
};

//* Splash
final Map<String, Widget Function(BuildContext)> splashRoutes = {
  SplashRoutes.splash: (context) => SplashScreen(),
};

//* Home
final Map<String, Widget Function(BuildContext)> homeRoutes = {
  HomeRoutes.main: (context) => MainScreen(),
};

//* Transactions
final Map<String, Widget Function(BuildContext)> transactionsRoutes = {};

//* Budget
final Map<String, Widget Function(BuildContext)> budgetRoutes = {};

//* Pots
final Map<String, Widget Function(BuildContext)> potsRoutes = {};

//* Reuccuring Bills
final Map<String, Widget Function(BuildContext)> reuccuringBillsRoutes = {};
