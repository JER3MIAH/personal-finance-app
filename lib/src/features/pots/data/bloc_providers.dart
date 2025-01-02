import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/app_injection_container.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_event.dart';

final List<BlocProvider> potsBlocProviders = [
  BlocProvider(
    create: (context) => getIt<PotsBloc>()..add(GetPots()),
  ),
];
