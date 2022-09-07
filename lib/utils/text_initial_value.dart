import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/empty_string.dart';

class TextInitialValue {
  String? text;

  TextInitialValue(this.text);

  String? value() {
    final value = Defined(text);

    if (value.exist() && EmptyString(value.get()).isNotEmpty()) {
      return value.get();
    }

    return null;
  }
}
