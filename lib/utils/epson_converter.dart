import 'package:intl/intl.dart';

extension EpsonDateTimeExtension on int {
  DateTime get _asDateTime {
    // If this value is in seconds, convert to milliseconds
    if (this < 10000000000) {
      return DateTime.fromMillisecondsSinceEpoch(this * 1000);
    }
    return DateTime.fromMillisecondsSinceEpoch(this);
  }

  /// Returns: Sunday, 29 Jun, 2025
  String get date => DateFormat('EEEE, dd MMM, yyyy').format(_asDateTime);

  /// Returns: 07:00 PM
  String get time => DateFormat('hh:mm a').format(_asDateTime);
}
