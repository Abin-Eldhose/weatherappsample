import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final dateFormat = DateFormat("h:mm a - EEEE d MMMM 'yy");
  return dateFormat.format(dateTime);
}
