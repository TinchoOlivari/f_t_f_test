import 'package:intl/intl.dart';

/// Calculates the difference between a given date and the current date and
/// time, expressing the result in days or hours.
String daysAgoFormat(String? dateString) {
  try {
    DateTime givenDate = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString!);
    DateTime currentDate = DateTime.now().toUtc();
    Duration difference = currentDate.difference(givenDate);

    if (difference.inDays > 0) {
      return "${difference.inDays}d";
    } else {
      int hours = difference.inHours;
      return "$hours${hours == 1 ? 'h' : 'hs'}";
    }
  } catch (e) {
    return 'N/A';
  }
}
