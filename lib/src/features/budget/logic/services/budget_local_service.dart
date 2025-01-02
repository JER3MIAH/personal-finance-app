import 'dart:developer';
import 'package:personal_finance_app/src/features/budget/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetLocalService {
  final SharedPreferences prefs;

  BudgetLocalService({required this.prefs});

  Future<List<Budget>> getBudgets() async {
    try {
      List<String>? jsonList = prefs.getStringList('budget_list');
      if (jsonList == null) return [];

      return jsonList.map((json) => Budget.fromJson(json)).toList();
    } catch (e, stack) {
      log('error getting budgets: $e at $stack');
      return [];
    }
  }

  Future<void> addNewBudget(Budget budget) async {
    try {
      List<String>? existingJsonList = prefs.getStringList('budget_list');

      List<Budget> existing = existingJsonList != null
          ? existingJsonList.map((json) => Budget.fromJson((json))).toList()
          : [];

      if (!existing.any((b) => b.category == budget.category)) {
        existing = [budget, ...existing];
      }

      List<String> updatedJsonList =
          existing.map((preset) => preset.toJson()).toList();
      await prefs.setStringList('budget_list', updatedJsonList);
    } catch (e, stack) {
      log('error creating budget: $e at $stack');
    }
  }

  Future<void> editBudget(Budget updatedBudget) async {
    try {
      List<String>? jsonList = prefs.getStringList('budget_list');

      if (jsonList != null) {
        List<Budget> existing = jsonList.map((json) {
          return Budget.fromJson(json);
        }).toList();

        int index = existing.indexWhere((budget) => budget.category == updatedBudget.category);

        if (index != -1) {
          existing[index] = updatedBudget;
        }

        List<String> updatedJsonList =
            existing.map((budget) => budget.toJson()).toList();
        await prefs.setStringList('budget_list', updatedJsonList);
      }
    } catch (e, stack) {
      log('error editing budget: $e at $stack');
    }
  }

  Future<void> removeBudget(String budgetCategory) async {
    try {
      List<String>? jsonList = prefs.getStringList('budget_list');

      if (jsonList != null) {
        List<Budget> existing =
            jsonList.map((json) => Budget.fromJson(json)).toList();

        existing.removeWhere((budget) => budget.category == budgetCategory);

        List<String> updatedjsonList =
            existing.map((budget) => budget.toJson()).toList();
        await prefs.setStringList('budget_list', updatedjsonList);
      }
    } catch (e, stack) {
      log('error removing budget: $e at $stack');
    }
  }
}
