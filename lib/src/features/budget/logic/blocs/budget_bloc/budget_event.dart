import 'package:equatable/equatable.dart';
import 'package:personal_finance_app/src/features/budget/data/models/models.dart';

abstract class BudgetEvent extends Equatable {
  const BudgetEvent();

  @override
  List<Object> get props => [];
}

class GetBudgets extends BudgetEvent {
  const GetBudgets();
}

class AddNewBudget extends BudgetEvent {
  final Budget budget;
  const AddNewBudget({
    required this.budget,
  });

  @override
  List<Object> get props => [budget];
}

class SpendFromBudget extends BudgetEvent {
  final String budgetCategory;
  final double amount;
  const SpendFromBudget({
    required this.budgetCategory,
    required this.amount,
  });

  @override
  List<Object> get props => [budgetCategory, amount];
}

class EditBudget extends BudgetEvent {
  final String budgetCategory;
  final Budget editedBudget;
  const EditBudget({
    required this.budgetCategory,
    required this.editedBudget,
  });

  @override
  List<Object> get props => [budgetCategory, editedBudget];
}

class DeleteBudget extends BudgetEvent {
  final String budgetCategory;
  const DeleteBudget({
    required this.budgetCategory,
  });

  @override
  List<Object> get props => [budgetCategory];
}
