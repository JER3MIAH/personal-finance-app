import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/transaction.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/transaction_bloc/transaction_event.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/transaction_bloc/transaction_state.dart';
import 'package:personal_finance_app/src/features/transactions/logic/services/transaction_local_service.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionLocalService localService;
  TransactionBloc({
    required this.localService,
  }) : super(TransactionState()) {
    on<GetTransactions>(_getTransactions);
    on<AddNewTransaction>(_addNewTransaction);
    on<EditTransaction>(_editTransaction);
    on<DeleteTransaction>(_deleteTransaction);
  }

  void _getTransactions(
      GetTransactions event, Emitter<TransactionState> emit) async {
    final transactions = await localService.getTransactions();
    emit(state.copyWith(transactions: transactions));
  }

  void _addNewTransaction(
      AddNewTransaction event, Emitter<TransactionState> emit) {
    final transactions = [event.transaction, ...state.transactions];
    localService.addNewTransaction(event.transaction);
    emit(state.copyWith(transactions: transactions));
  }

  void _editTransaction(EditTransaction event, Emitter<TransactionState> emit) {
    final transactionToEdit = findTransaction(event.transactionId);
    final editedTransaction = transactionToEdit.copyWith(
      amount: event.amount,
      category: event.category,
      date: event.date,
      debit: event.debit,
      title: event.title,
    );

    final transactions = state.transactions
        .map((transaction) => transaction.id == transactionToEdit.id
            ? editedTransaction
            : transaction)
        .toList();

    localService.editTransaction(editedTransaction);
    emit(state.copyWith(transactions: transactions));
  }

  void _deleteTransaction(
      DeleteTransaction event, Emitter<TransactionState> emit) {
    final transactionToDelete = findTransaction(event.transactionId);

    final transactions = state.transactions
        .where((transaction) => transaction.id != transactionToDelete.id)
        .toList();

    localService.removeTransaction(transactionToDelete.id);
    emit(state.copyWith(transactions: transactions));
  }

  //* ---------- Helper functions ---------- *//
  Transaction findTransaction(String transactionId) {
    return state.transactions.firstWhere(
      (transaction) => transaction.id == transactionId,
      orElse: () {
        throw ArgumentError('transaction with name: $transactionId not found');
      },
    );
  }
}
