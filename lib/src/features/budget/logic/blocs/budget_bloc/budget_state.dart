import 'package:equatable/equatable.dart';
import 'package:personal_finance_app/src/features/budget/data/models/budget.dart';

class BudgetState extends Equatable {
  final List<Budget> budgets;
  const BudgetState({
    this.budgets = const [],
  });

  @override
  List<Object> get props => [budgets];

  BudgetState copyWith({
    List<Budget>? budgets,
  }) {
    return BudgetState(
      budgets: budgets ?? this.budgets,
    );
  }
}
