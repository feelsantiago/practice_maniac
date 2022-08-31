import '../defined.dart';

abstract class Validator<T> {
  String? validate(T? value);
}

class EmptyTextValidator implements Validator<String> {
  final String message;

  EmptyTextValidator({this.message = 'Please enter some text...'});

  @override
  String? validate(String? value) {
    final text = Defined(value);

    if (text.not.exist() || text.get().isEmpty) {
      return message;
    }

    return null;
  }
}
