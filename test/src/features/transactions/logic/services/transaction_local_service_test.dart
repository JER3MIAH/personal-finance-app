import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/transaction.dart';
import 'package:personal_finance_app/src/features/transactions/logic/services/transaction_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late TransactionLocalService localService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = TransactionLocalService(prefs: prefs);
  });

  group('Transaction Local Service -', () {
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

    test(
        '[addTransaction] updates the transaction list with provided transaction',
        () async {
      await localService.addNewTransaction(testTransaction);
      final transactions = await localService.getTransactions();

      expect(transactions, [testTransaction]);
    });

    test(
        '[editTransaction] updates the transaction list with provided transaction',
        () async {
      await localService.addNewTransaction(testTransaction);
      final updatedTransaction =
          testTransaction2.copyWith(id: testTransaction.id);
      await localService.editTransaction(updatedTransaction);
      final transactions = await localService.getTransactions();

      expect(transactions, [updatedTransaction]);
    });

    test(
        '[removeTransaction] removes provided transaction from the transaction list',
        () async {
      await localService.addNewTransaction(testTransaction);
      await localService.removeTransaction(testTransaction.id);
      final transactions = await localService.getTransactions();

      expect(transactions, []);
    });
  });
}
