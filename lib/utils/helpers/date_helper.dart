import 'package:intl/intl.dart';

final format = DateFormat('HH:mm');

extension GetHour on int {
  String toHour() {
    return format.format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }
}