import 'package:flutter/widgets.dart';
import 'package:personal_finance_app/src/features/budget/presentation/screens/budget_screen.dart';
import 'package:personal_finance_app/src/features/home/presentation/screens/overview_screen.dart';
import 'package:personal_finance_app/src/features/pots/presentation/screens/pot_screen.dart';
import 'package:personal_finance_app/src/features/transactions/presentation/screens/screens.dart';

List<Widget> PAGES = const [
  OverviewScreen(),
  TransactionScreen(),
  BudgetScreen(),
  PotScreen(),
];
