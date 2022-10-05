import 'package:intl/intl.dart';

abstract class DateTextStyle {
  String format();
}

class BrazilianDateStyle implements DateTextStyle {
  const BrazilianDateStyle();

  @override
  String format() {
    return 'dd/MM/yyyy';
  }
}

class DateText {
  final DateTime date;

  DateText(this.date);

  String extract({DateTextStyle style = const BrazilianDateStyle()}) {
    final text = DateFormat(style.format());
    return text.format(date);
  }
}
