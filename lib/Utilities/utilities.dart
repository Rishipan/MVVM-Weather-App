import 'package:intl/intl.dart';

class Utilities {
  Map<dynamic, String> imageMap = {
    'Partially cloudy': 'assets/images/nightRain.png',
    'Overcast': 'assets/images/sunSlowRain.png',
    'Clear': 'assets/images/day_clear.png',
    'null': 'assets/images/nightStatRain.png',
  };

  static String formateDate(DateTime date) {
    String formmttedDate = DateFormat('EEEE d MMM').format(date);
    return formmttedDate;
  }

  static String extractDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('d').format(dateTime);
    return formattedDate;
  }

  static String extractDay(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('EEEE').format(dateTime);
    String abreviatedDate = formattedDate.substring(0, 3);
    return abreviatedDate;
  }

  static String formateTime(String time) {
    DateFormat dateFormat = DateFormat('hh:mm a');
    DateTime dateTime = DateTime.parse('2023-08-08T$time');
    String timeIn12HourFormate = dateFormat.format(dateTime);
    return timeIn12HourFormate; // 3:30pm
  }

  static String currentTime() {
    DateFormat dateFormat = DateFormat('hh:mm a');
    DateTime now = DateTime.now();
    String time = dateFormat.format(now);
    return time;
  }

  static String currentTime24(String time) {
    DateFormat dateFormat = DateFormat('HH:mm');
    DateTime dateTime = dateFormat.parse(time);
    String timeIn24HourFormat = dateFormat.format(dateTime);
    return timeIn24HourFormat;
  }

  static bool checkTime(String time) {
    DateFormat dateFormat = DateFormat('hh a');
    DateTime dateTime = DateTime.parse('2024-01-01T$time');
    DateTime now = DateTime.now();
    return dateFormat.format(dateTime) == dateFormat.format(now);
  }
}
