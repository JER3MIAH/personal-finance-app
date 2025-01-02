import 'package:personal_finance_app/src/app_injection_container.dart';
import 'package:personal_finance_app/src/features/budget/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/budget/logic/services/budget_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetInjectionContainer {
  static Future<void> init() async {
    //* Services
    getIt.registerLazySingleton<BudgetLocalService>(
      () => BudgetLocalService(prefs: getIt<SharedPreferences>()),
    );

    //* Blocs
    getIt.registerLazySingleton<BudgetBloc>(
      () => BudgetBloc(localService: getIt<BudgetLocalService>()),
    );
  }
}
