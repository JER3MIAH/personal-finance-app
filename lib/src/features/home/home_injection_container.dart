import 'package:personal_finance_app/src/app_injection_container.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/cubits.dart';

class HomeInjectionContainer {
  static Future<void> init() async {
    //* Services

    //* Blocs

    //* Cubits
    getIt.registerLazySingleton<BottomNavBarCubit>(
      () => BottomNavBarCubit(),
    );
  }
}
