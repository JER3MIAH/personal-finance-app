import 'package:equatable/equatable.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/transaction.dart';

class TransactionState extends Equatable {
  final List<Transaction> transactions;
  const TransactionState({
    this.transactions = const [],
  });

  @override
  List<Object> get props => [transactions];

  TransactionState copyWith({
    List<Transaction>? transactions,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
    );
  }
}
