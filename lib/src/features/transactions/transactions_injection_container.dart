import 'package:personal_finance_app/src/app_injection_container.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:personal_finance_app/src/features/transactions/logic/services/transaction_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionsInjectionContainer {
  static Future<void> init() async {
    //* Services
    getIt.registerLazySingleton<TransactionLocalService>(
      () => TransactionLocalService(prefs: getIt<SharedPreferences>()),
    );

    //* Blocs
    getIt.registerLazySingleton<TransactionBloc>(
      () => TransactionBloc(localService: getIt<TransactionLocalService>()),
    );
  }
}
