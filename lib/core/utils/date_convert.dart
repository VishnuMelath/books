import 'package:books/core/constants/months.dart';

String dateToMMDDYYConvert(String datetime) {
  var date = datetime.split('T').first;
  var list = date.split('-');
  return '${month[int.parse(list[1])]} ${list[2]}, ${list[0]}';
}
