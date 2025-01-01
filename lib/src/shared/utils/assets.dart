const String iconPath = 'assets/icons/';
const String avatarPath = 'assets/avatars/';

final String iconBillDue = '${iconPath}icon-bill-due'.svg;
final String iconBillPaid = '${iconPath}icon-bill-paid'.svg;
final String iconCaretDown = '${iconPath}icon-caret-down'.svg;
final String iconCaretLeft = '${iconPath}icon-caret-left'.svg;
final String iconCaretRight = '${iconPath}icon-caret-right'.svg;
final String iconCloseModal = '${iconPath}icon-close-modal'.svg;
final String iconEllipsis = '${iconPath}icon-ellipsis'.svg;
final String iconFilterMobile = '${iconPath}icon-filter-mobile'.svg;
final String iconHidePassword = '${iconPath}icon-hide-password'.svg;
final String iconMinimizeMenu = '${iconPath}icon-minimize-menu'.svg;
final String iconNavBudgets = '${iconPath}icon-nav-budgets'.svg;
final String iconNavOverview = '${iconPath}icon-nav-overview'.svg;
final String iconNavPots = '${iconPath}icon-nav-pots'.svg;
final String iconNavRecurringBills = '${iconPath}icon-nav-recurring-bills'.svg;
final String iconNavTransactions = '${iconPath}icon-nav-transactions'.svg;
final String iconPot = '${iconPath}icon-pot'.svg;
final String iconRecurringBills = '${iconPath}icon-recurring-bills'.svg;
final String iconSearch = '${iconPath}icon-search'.svg;
final String iconSelected = '${iconPath}icon-selected'.svg;
final String iconShowPassword = '${iconPath}icon-show-password'.svg;
final String iconSortMobile = '${iconPath}icon-sort-mobile'.svg;
final String iconAuthenticationIllustration =
    '${iconPath}illustration-authentication'.svg;
final String iconLargeLogo = '${iconPath}logo-large'.svg;
final String iconSmallLogo = '${iconPath}logo-small'.svg;

extension ImageExtension on String {
  String get svg => '$iconPath$this.svg';
  String get jpg => '$avatarPath$this.jpg';
}
