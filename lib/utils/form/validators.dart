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

class OnlyNumbersValidator implements Validator<String> {
  final String message;

  OnlyNumbersValidator({this.message = 'Only numbers are allowed...'});

  @override
  String? validate(String? value) {
    final number = Defined(double.tryParse(value ?? ''));

    if (number.not.exist()) {
      return message;
    }

    return null;
  }
}

class GreaterThanValidator implements Validator<String> {
  final String message;
  final int base;

  GreaterThanValidator({required this.base, String? message})
      : message = message ?? 'The value must be greater than $base...';

  @override
  String? validate(String? value) {
    final number = Defined(int.tryParse(value ?? ''));

    if (number.not.exist() || number.get() <= base) {
      return message;
    }

    return null;
  }
}
