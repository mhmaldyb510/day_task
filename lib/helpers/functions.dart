

int getDaysInMonth(int year, int month) {
  // Returns the number of days in the specified month of a given year.
//
// The function calculates the last day of the specified month by
// determining the day before the first day of the following month.
// Handles the transition between December and January correctly.
//
// [year] The year as a four-digit integer.
// [month] The month as an integer from 1 (January) to 12 (December).
//
// Returns the number of days in the specified month.

  // If the month is December, the next month is January of the next year
  int nextMonth = month == 12 ? 1 : month + 1;
  int nextMonthYear = month == 12 ? year + 1 : year;

  // The last day of the current month is the day before the first day of the next month
  DateTime firstDayNextMonth = DateTime(nextMonthYear, nextMonth, 1);
  DateTime lastDayCurrentMonth =
      firstDayNextMonth.subtract(const Duration(days: 1));

  return lastDayCurrentMonth.day;
}

String getDifferenceBetweenTwoDates(DateTime startDate, DateTime endDate) {
  Duration difference = endDate.difference(startDate);
  int days = difference.inDays;
  int hours = difference.inHours;
  int minutes = difference.inMinutes;
  int seconds = difference.inSeconds;
  if (days == 0) {
    if (hours == 0) {
      if (minutes == 0) {
        return '$seconds seconds';
      }
      return '$minutes mins';
    }
    return '$hours hours';
  }
  return '$days days';
}
