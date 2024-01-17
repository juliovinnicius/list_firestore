import 'package:intl/intl.dart';

extension CurrencyFormatterExtension on DateTime {
  static final _dateFormatDayMonthYear = DateFormat('dd/MM/yyyy');

  String asBrazilDate() => _dateFormatDayMonthYear.format(this);
}
