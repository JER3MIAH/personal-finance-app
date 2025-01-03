import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/transaction.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/transaction_bloc/transaction_event.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/transaction_bloc/transaction_state.dart';
import 'package:personal_finance_app/src/features/transactions/logic/services/transaction_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late TransactionLocalService localService;
  late TransactionBloc transactionBloc;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = TransactionLocalService(prefs: prefs);
    transactionBloc = TransactionBloc(localService: localService);
  });

  tearDown(() {
    transactionBloc.close();
  });

  group('Transactions Bloc -', () {
    final testTransaction = Transaction(
      id: 'id1',
      category: 'transactionCategory',
      date: DateTime.now(),
      amount: 30,
      debit: true,
      title: 'title1',
    );

    final testTransaction2 = Transaction(
      id: 'id2',
      category: 'transaction2Category',
      date: DateTime.now(),
      amount: 100,
      debit: true,
      title: 'title2',
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionState(transactions: [])] when GetTransactions is added after build.',
      build: () => transactionBloc,
      act: (bloc) => bloc.add(GetTransactions()),
      expect: () => [TransactionState(transactions: [])],
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionState(transactions: [testTransaction])] when AddNewTransaction is added.',
      build: () => transactionBloc,
      act: (bloc) => bloc.add(AddNewTransaction(transaction: testTransaction)),
      expect: () => [
        TransactionState(transactions: [testTransaction])
      ],
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionState] with updated transaction when EditTransaction is added.',
      build: () => transactionBloc,
      seed: () =>
          TransactionState(transactions: [testTransaction, testTransaction2]),
      act: (bloc) => bloc.add(EditTransaction(
        transactionId: testTransaction.id,
        amount: 50,
        category: 'newCategory',
        date: DateTime(2025),
        debit: false,
        title: 'new title',
      )),
      expect: () => [
        TransactionState(
          transactions: [
            Transaction(
              id: testTransaction.id,
              amount: 50,
              category: 'newCategory',
              date: DateTime(2025),
              debit: false,
              title: 'new title',
            ),
            testTransaction2,
          ],
        ),
      ],
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionState] with updated transaction when DeleteTransaction is added.',
      build: () => transactionBloc,
      seed: () =>
          TransactionState(transactions: [testTransaction, testTransaction2]),
      act: (bloc) =>
          bloc.add(DeleteTransaction(transactionId: testTransaction.id)),
      expect: () => [
        TransactionState(transactions: [testTransaction2]),
      ],
    );
  });
}
