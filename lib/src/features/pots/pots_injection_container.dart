import 'package:personal_finance_app/src/app_injection_container.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/services/pots_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PotsInjectionContainer {
  static Future<void> init() async {
    //* Services
    getIt.registerLazySingleton<PotsLocalService>(
      () => PotsLocalService(prefs: getIt<SharedPreferences>()),
    );

    //* Blocs
    getIt.registerLazySingleton<PotsBloc>(
      () => PotsBloc(localService: getIt<PotsLocalService>()),
    );
  }
}
