import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/app_injection_container.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/cubits.dart';

final List<BlocProvider> homeBlocProviders = [
  BlocProvider<BottomNavBarCubit>(
    create: (_) => getIt<BottomNavBarCubit>(),
  ),
];
