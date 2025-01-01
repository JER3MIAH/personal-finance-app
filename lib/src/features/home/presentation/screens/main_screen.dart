import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText('Main Screen'),
      ),
    );
  }
}
