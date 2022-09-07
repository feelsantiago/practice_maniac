import 'not.dart';

class EmptyString {
  final String string;

  EmptyString(this.string);

  bool isEmpty() {
    return string.isEmpty || string.toLowerCase() == 'empty';
  }

  bool isNotEmpty() {
    return Not(isEmpty()).value;
  }
}
