import 'package:practice_maniac/utils/defined.dart';

import 'validators.dart';

typedef ValidatorHandler<T> = String? Function(T? value);

abstract class ValidatorErrorState {
  bool exist();
  String? error();
}

class ValidatorSuccess implements ValidatorErrorState {
  @override
  String? error() {
    return null;
  }

  @override
  bool exist() {
    return true;
  }
}

class ValidatorError<T> implements ValidatorErrorState {
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
    if (Defined(_result).not.exist()) {
      exist();
    }

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
          .map<ValidatorErrorState>(
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
