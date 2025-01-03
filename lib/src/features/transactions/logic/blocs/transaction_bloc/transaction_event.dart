import 'package:equatable/equatable.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/transaction.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class GetTransactions extends TransactionEvent {
  const GetTransactions();
}

class AddNewTransaction extends TransactionEvent {
  final Transaction transaction;
  const AddNewTransaction({
    required this.transaction,
  });

  @override
  List<Object> get props => [transaction];
}

class EditTransaction extends TransactionEvent {
  final String transactionId;
  final String title;
  final String category;
  final DateTime date;
  final double amount;
  final bool debit;
  const EditTransaction({
    required this.transactionId,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.debit,
  });

  @override
  List<Object> get props =>
      [transactionId, title, category, date, amount, debit];
}

class DeleteTransaction extends TransactionEvent {
  final String transactionId;
  const DeleteTransaction({
    required this.transactionId,
  });

  @override
  List<Object> get props => [transactionId];
}
