import 'package:intl/intl.dart';

String duTimeLineFormat(DateTime time) {
  var now = DateTime.now();
  var difference = now.difference(time);

  // 1天内
  if (difference.inHours < 24) {
    return "${difference.inHours} hours ago";
  }
  // 30天内
  else if (difference.inDays < 30) {
    return "${difference.inDays} days ago";
  }
  // MM-dd
  else if (difference.inDays < 365) {
    final dtFormat = new DateFormat('MM-dd');
    return dtFormat.format(time);
  }
  else {
    final dtFormat = new DateFormat('yyyy-MM-dd');
    var str = dtFormat.format(time);
    return str;
  }
}
