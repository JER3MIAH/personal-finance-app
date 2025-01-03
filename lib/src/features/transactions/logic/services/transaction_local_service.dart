import 'dart:developer';
import 'package:personal_finance_app/src/features/transactions/data/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionLocalService {
  final SharedPreferences prefs;

  TransactionLocalService({required this.prefs});

  Future<List<Transaction>> getTransactions() async {
    try {
      List<String>? jsonList = prefs.getStringList('transaction_list');
      if (jsonList == null) return [];

      return jsonList.map((json) => Transaction.fromJson(json)).toList();
    } catch (e, stack) {
      log('error getting transactions: $e at $stack');
      return [];
    }
  }

  Future<void> addNewTransaction(Transaction transaction) async {
    try {
      List<String>? existingJsonList = prefs.getStringList('transaction_list');

      List<Transaction> existing = existingJsonList != null
          ? existingJsonList
              .map((json) => Transaction.fromJson((json)))
              .toList()
          : [];

      if (!existing.any((b) => b.id == transaction.id)) {
        existing = [transaction, ...existing];
      }

      List<String> updatedJsonList =
          existing.map((preset) => preset.toJson()).toList();
      await prefs.setStringList('transaction_list', updatedJsonList);
    } catch (e, stack) {
      log('error creating transaction: $e at $stack');
    }
  }

  Future<void> editTransaction(Transaction updatedTransaction) async {
    try {
      List<String>? jsonList = prefs.getStringList('transaction_list');

      if (jsonList != null) {
        List<Transaction> existing = jsonList.map((json) {
          return Transaction.fromJson(json);
        }).toList();

        int index = existing.indexWhere((transaction) =>
            transaction.id == updatedTransaction.id);

        if (index != -1) {
          existing[index] = updatedTransaction;
        }

        List<String> updatedJsonList =
            existing.map((transaction) => transaction.toJson()).toList();
        await prefs.setStringList('transaction_list', updatedJsonList);
      }
    } catch (e, stack) {
      log('error editing transaction: $e at $stack');
    }
  }

  Future<void> removeTransaction(String transactionId) async {
    try {
      List<String>? jsonList = prefs.getStringList('transaction_list');

      if (jsonList != null) {
        List<Transaction> existing =
            jsonList.map((json) => Transaction.fromJson(json)).toList();

        existing.removeWhere(
            (transaction) => transaction.id == transactionId);

        List<String> updatedjsonList =
            existing.map((transaction) => transaction.toJson()).toList();
        await prefs.setStringList('transaction_list', updatedjsonList);
      }
    } catch (e, stack) {
      log('error removing transaction: $e at $stack');
    }
  }
}
