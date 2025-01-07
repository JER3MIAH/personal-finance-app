const String iconPath = 'assets/icons/';
const String avatarPath = 'assets/avatars/';

final String iconBillDue = 'icon-bill-due'.svg;
final String iconBillPaid = 'icon-bill-paid'.svg;
final String iconCaretDown = 'icon-caret-down'.svg;
final String iconCaretLeft = 'icon-caret-left'.svg;
final String iconCaretRight = 'icon-caret-right'.svg;
final String iconCloseModal = 'icon-close-modal'.svg;
final String iconEllipsis = 'icon-ellipsis'.svg;
final String iconFilterMobile = 'icon-filter-mobile'.svg;
final String iconHidePassword = 'icon-hide-password'.svg;
final String iconMinimizeMenu = 'icon-minimize-menu'.svg;
final String iconExpandMenu = 'icon-expand-menu'.svg;
final String iconNavBudgets = 'icon-nav-budgets'.svg;
final String iconNavOverview = 'icon-nav-overview'.svg;
final String iconNavPots = 'icon-nav-pots'.svg;
final String iconNavRecurringBills = 'icon-nav-recurring-bills'.svg;
final String iconNavTransactions = 'icon-nav-transactions'.svg;
final String iconPot = 'icon-pot'.svg;
final String iconRecurringBills = 'icon-recurring-bills'.svg;
final String iconSearch = 'icon-search'.svg;
final String iconSelected = 'icon-selected'.svg;
final String iconShowPassword = 'icon-show-password'.svg;
final String iconSortMobile = 'icon-sort-mobile'.svg;
final String iconAuthenticationIllustration = 'illustration-authentication'.svg;
final String iconLargeLogo = 'logo-large'.svg;
final String iconSmallLogo = 'logo-small'.svg;

extension ImageExtension on String {
  String get svg => '$iconPath$this.svg';
  String get jpg => '$avatarPath$this.jpg';
}
