import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateToLocalString(DateTime date) {
    return DateFormat.yMd().format(date);
  }
}
