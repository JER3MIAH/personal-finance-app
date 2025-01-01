import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/features/budget/data/bloc_providers.dart';
import 'package:personal_finance_app/src/features/pots/data/bloc_providers.dart';
import 'package:personal_finance_app/src/features/reoccuring_bills/data/bloc_providers.dart';
import 'package:personal_finance_app/src/shared/shared.dart';
import 'features/home/data/bloc_providers.dart';
import 'features/transactions/data/bloc_providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...homeBlocProviders,
        ...transactionsBlocProviders,
        ...budgetBlocProviders,
        ...potsBlocProviders,
        ...reoccuringBillsBlocProviders,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prsonal Finance App',
        theme: appTheme,
        routes: appRoutes,
        initialRoute: HomeRoutes.main,
      ),
    );
  }
}
