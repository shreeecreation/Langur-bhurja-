import 'package:intl/intl.dart';

class DateFormatterHelper {
  DateFormatterHelper._();

  static String getFormattedDateTime(String getTime) {
    String timestamp = getTime;
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedTime = formatDateTime(dateTime);
    return formattedTime;
  }

  static String formatDateTime(DateTime dateTime) {
    var formatter = DateFormat('MMMM dd, hh:mm:ss a', 'en_US');
    return formatter.format(dateTime.toLocal());
  }
}
