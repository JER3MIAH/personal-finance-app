abstract class AppRoutes {}

class SplashRoutes {
  static const splash = '/splash';
}

class HomeRoutes extends AppRoutes {
  static const main = '/';
  static const overview = '/overviewScreen';
}

class TransactionsRoutes extends AppRoutes {}

class BudgetsRoutes extends AppRoutes {}

class BudgetRoutes extends AppRoutes {}

class PotsRoutes extends AppRoutes {}

class ReuccuringBillRoutes extends AppRoutes {}
