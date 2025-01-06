import 'package:intl/intl.dart';

String formatDate(
  DateTime dateTime,
) {
  return DateFormat('h:mm a, dd MMM yyyy').format(dateTime);
}

String formatNumber(double number) {
  return NumberFormat('#,##0').format(number);
}
