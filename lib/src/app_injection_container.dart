import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/features/budget/budget_injection_container.dart';
import 'package:personal_finance_app/src/features/home/home_injection_container.dart';
import 'package:personal_finance_app/src/features/pots/pots_injection_container.dart';
import 'package:personal_finance_app/src/features/reoccuring_bills/reoccuring_bills_injection_container.dart';
import 'package:personal_finance_app/src/features/transactions/transactions_injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class AppInjectionContainer {
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => prefs);
    //* -----

    await HomeInjectionContainer.init();
    await TransactionsInjectionContainer.init();
    await BudgetInjectionContainer.init();
    await PotsInjectionContainer.init();
    await ReoccuringBillsInjectionContainer.init();
  }
}
