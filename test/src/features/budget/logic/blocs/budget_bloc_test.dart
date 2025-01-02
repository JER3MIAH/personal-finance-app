import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_app/src/features/budget/data/models/models.dart';
import 'package:personal_finance_app/src/features/budget/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/budget/logic/services/budget_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late BudgetLocalService localService;
  late BudgetBloc budgetBloc;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = BudgetLocalService(prefs: prefs);
    budgetBloc = BudgetBloc(localService: localService);
  });

  tearDown(() {
    budgetBloc.close();
  });

  group('Budgets Bloc -', () {
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

    blocTest<BudgetBloc, BudgetState>(
      'emits [BudgetState(budgets: [])] when GetBudgets is added after build.',
      build: () => budgetBloc,
      act: (bloc) => bloc.add(GetBudgets()),
      expect: () => [BudgetState(budgets: [])],
    );

    blocTest<BudgetBloc, BudgetState>(
      'emits [BudgetState(budgets: [testBudget])] when AddNewBudget is added.',
      build: () => budgetBloc,
      act: (bloc) => bloc.add(AddNewBudget(budget: testBudget)),
      expect: () => [
        BudgetState(budgets: [testBudget])
      ],
    );

    blocTest<BudgetBloc, BudgetState>(
      'emits [BudgetState] with updated total property when SpendFromBudget is added.',
      build: () => budgetBloc,
      seed: () => BudgetState(budgets: [testBudget.copyWith(spent: 20.0)]),
      act: (bloc) => bloc
          .add(SpendFromBudget(budgetCategory: 'budgetCategory', amount: 30.0)),
      expect: () => [
        BudgetState(budgets: [testBudget.copyWith(spent: 50.0)])
      ],
    );

    blocTest<BudgetBloc, BudgetState>(
      'emits [BudgetState] with updated budget when EditBudget is added.',
      build: () => budgetBloc,
      seed: () => BudgetState(budgets: [testBudget, testBudget2]),
      act: (bloc) => bloc.add(EditBudget(
        budgetCategory: 'budgetCategory',
        editedBudget: testBudget.copyWith(category: 'newBudgetCategory'),
      )),
      expect: () => [
        isA<BudgetState>().having(
          (state) => state.budgets.first.category,
          'first budget category',
          'newBudgetCategory',
        ),
      ],
    );

    blocTest<BudgetBloc, BudgetState>(
      'emits [BudgetState] with updated budget when DeleteBudget is added.',
      build: () => budgetBloc,
      seed: () => BudgetState(budgets: [testBudget, testBudget2]),
      act: (bloc) => bloc.add(DeleteBudget(budgetCategory: 'budgetCategory')),
      expect: () => [
        BudgetState(budgets: [testBudget2]),
      ],
    );
  });
}
