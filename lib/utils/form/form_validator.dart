import 'package:practice_maniac/utils/defined.dart';

import 'validators.dart';

typedef ValidatorHandler<T> = String? Function(T? value);

abstract class ValidatorState {
  bool exist();
  String? error();
}

class ValidatorSuccess implements ValidatorState {
  @override
  String? error() {
    return null;
  }

  @override
  bool exist() {
    return true;
  }
}

class ValidatorError<T> implements ValidatorState {
  T value;
  Validator<T> validator;

  String? _result;

  ValidatorError(this.value, this.validator);

  @override
  bool exist() {
    _result = validator.validate(value);
    return Defined(_result).exist();
  }

  @override
  String? error() {
    return _result;
  }
}

class FormValidator<T> {
  final List<Validator<T>> validators;

  FormValidator(Validator<T> validator) : validators = [validator];
  FormValidator.concat(this.validators);

  ValidatorHandler<T> register() {
    return (T? value) {
      final valid = validators
          .map<ValidatorState>(
            (validator) => ValidatorError(value, validator),
          )
          .firstWhere(
            (error) => error.exist(),
            orElse: () => ValidatorSuccess(),
          );

      valid.error();
    };
  }
}
