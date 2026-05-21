class AppFormatter {
  static String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
  static String timeAgoSinceDate(DateTime notificationDate, {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    if ((difference.inDays / 30).floor() >= 2) {
      return '${difference.inDays} Months ago';
    }else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 Month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 Week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} Days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 Day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} Hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 Hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} Minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 Minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} Seconds ago';
    } else {
      return 'Just now';
    }
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
