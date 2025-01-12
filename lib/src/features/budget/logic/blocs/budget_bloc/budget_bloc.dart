import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/budget/data/models/models.dart';
import 'package:personal_finance_app/src/features/budget/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/budget/logic/services/budget_local_service.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetLocalService localService;
  BudgetBloc({
    required this.localService,
  }) : super(BudgetState()) {
    on<GetBudgets>(_getBudgets);
    on<AddNewBudget>(_addNewBudget);
    on<SpendFromBudget>(_spendFromBudget);
    on<EditBudget>(_editBudget);
    on<DeleteBudget>(_deleteBudget);
  }

  void _getBudgets(GetBudgets event, Emitter<BudgetState> emit) async {
    final budgets = await localService.getBudgets();
    emit(state.copyWith(budgets: budgets));
  }

  void _addNewBudget(AddNewBudget event, Emitter<BudgetState> emit) {
    final budgets = [event.budget, ...state.budgets];
    localService.addNewBudget(event.budget);
    emit(state.copyWith(budgets: budgets));
  }


  void _spendFromBudget(SpendFromBudget event, Emitter<BudgetState> emit) {
    final budgetToEdit = findBudget(event.budgetCategory);
    final editedBudget = budgetToEdit.copyWith(
      spent: (budgetToEdit.spent + event.amount),
    );

    final budgets = state.budgets
        .map((budget) => budget.category == budgetToEdit.category ? editedBudget : budget)
        .toList();

    localService.editBudget(editedBudget);
    emit(state.copyWith(budgets: budgets));
  }

  void _editBudget(EditBudget event, Emitter<BudgetState> emit) {
    final budgetToEdit = findBudget(event.budgetCategory);
    final editedBudget = event.editedBudget;

    final budgets = state.budgets
        .map((budget) => budget.category == budgetToEdit.category ? editedBudget : budget)
        .toList();

    localService.editBudget(editedBudget);
    emit(state.copyWith(budgets: budgets));
  }

  void _deleteBudget(DeleteBudget event, Emitter<BudgetState> emit) {
    final budgetToDelete = findBudget(event.budgetCategory);

    final budgets =
        state.budgets.where((budget) => budget.category != budgetToDelete.category).toList();

    localService.removeBudget(budgetToDelete.category);
    emit(state.copyWith(budgets: budgets));
  }

  //* ---------- Helper functions ---------- *//
  Budget findBudget(String budgetCategory) {
    return state.budgets.firstWhere(
      (budget) => budget.category == budgetCategory,
      orElse: () {
        throw ArgumentError('budget with name: $budgetCategory not found');
      },
    );
  }
}
