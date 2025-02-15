import 'package:intl/intl.dart';

class Formats {
  static String number(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 10,
      symbol: '',
      locale: 'en',
    ).format(number);
    return formattedNumber;
  }
}
