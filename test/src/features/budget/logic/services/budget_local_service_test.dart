import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_app/src/features/budget/data/models/models.dart';
import 'package:personal_finance_app/src/features/budget/logic/services/budget_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late BudgetLocalService localService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = BudgetLocalService(prefs: prefs);
  });

  group('Budget Local Service -', () {
    final testBudget = Budget(
      category: 'budgetCategory',
      theme: 'theme',
      spent: 120.0,
      maximum: 200.0,
    );

    final testBudget2 = Budget(
      category: 'budget2Category',
      theme: 'theme2',
      spent: 198.0,
      maximum: 500.0,
    );

    test('[addBudget] updates the budget list with provided budget', () async {
      await localService.addNewBudget(testBudget);
      final budgets = await localService.getBudgets();

      expect(budgets, [testBudget]);
    });

    test('[editBudget] updates the budget list with provided budget', () async {
      await localService.addNewBudget(testBudget);
      final updatedBudget = testBudget2.copyWith(category: testBudget.category);
      await localService.editBudget(updatedBudget);
      final budgets = await localService.getBudgets();

      expect(budgets, [updatedBudget]);
    });

    test('[removeBudget] removes provided budget from the budget list', () async {
      await localService.addNewBudget(testBudget);
      await localService.removeBudget(testBudget.category);
      final budgets = await localService.getBudgets();

      expect(budgets, []);
    });
  });
}
