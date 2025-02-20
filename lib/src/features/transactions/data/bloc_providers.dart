import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/app_injection_container.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/blocs.dart';

final List<BlocProvider> transactionsBlocProviders = [
  BlocProvider<TransactionBloc>(
    create: (_) => getIt<TransactionBloc>()..add(GetTransactions()),
  ),
];
