import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/app.dart';
import 'package:personal_finance_app/src/app_injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjectionContainer.init();

  runApp(const MyApp());
}
