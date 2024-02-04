import 'package:intl/intl.dart';

/// Calculates the difference between a given date and the current date and
/// time, expressing the result in days, hours or minutes.
String timeAgo(String? dateString) {
  try {
    DateTime givenDate =
        DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString!, true).toLocal();
    DateTime currentDate = DateTime.now().toUtc();
    Duration difference = currentDate.difference(givenDate);

    if (difference.inDays > 0) {
      return "${difference.inDays}d";
    } else {
      int hours = difference.inHours;
      if (hours > 0) {
        return "$hours${hours == 1 ? 'h' : 'hs'}";
      } else {
        int minutes = difference.inMinutes;
        return "${minutes}m";
      }
    }
  } catch (e) {
    return 'N/A';
  }
}
