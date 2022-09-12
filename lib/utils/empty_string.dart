import 'not.dart';

class EmptyString {
  final String string;

  EmptyString(this.string);
  static String empty() => 'empty';

  bool isEmpty() {
    return string.isEmpty || string.toLowerCase() == EmptyString.empty();
  }

  bool isNotEmpty() {
    return Not(isEmpty()).value;
  }
}
