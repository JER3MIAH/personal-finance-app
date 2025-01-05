import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class DesktopMainScreen extends StatelessWidget {
  const DesktopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText('Desktop Main Screen'),
      ),
    );
  }
}
