import 'package:intl/intl.dart';

class DateUtil {
  static final baseDateFormat = DateFormat('dd MMMM HH:mm');
  static final millisFormat = NumberFormat("000", "en_US");
  static final _hour = Duration(hours: 1).inMilliseconds;
  static final _minute = Duration(minutes: 1).inMilliseconds;
  static final _day = Duration(days: 1).inMilliseconds;
  static final _second = Duration(seconds: 1).inMilliseconds;
  static final minusString = "- ";

  static String getRemainingTimer(int time) {
    final currentMillis = DateTime.now().millisecondsSinceEpoch;
    int timeLeft = time - currentMillis;

    var answer = "";
    if (timeLeft < 0) {
      answer += minusString;
      timeLeft = -timeLeft;
    }

    if (timeLeft > _day) {
      final days = timeLeft ~/ _day;
      answer += "$days d. ";
      timeLeft -= _day * days;
    }

    if (timeLeft > _hour) {
      final hours = timeLeft ~/ _hour;
      answer += "$hours h. ";
      timeLeft -= _hour * hours;
    }

    if (timeLeft > _minute) {
      final minutes = timeLeft ~/ _minute;
      answer += "$minutes min. ";
      timeLeft -= _minute * minutes;
    }

    if (timeLeft > _second) {
      final seconds = timeLeft ~/ _second;
      answer += "$seconds sec. ";
      timeLeft -= _second * seconds;
    }

    answer += millisFormat.format(
        DateTime.fromMillisecondsSinceEpoch(time - currentMillis).millisecond);
    return answer;
  }
}
