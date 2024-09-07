import 'package:formz/formz.dart';

class EmailInput extends FormzInput<String, AuthInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  EmailInput dirty([String? value]) => EmailInput.dirty(value ?? this.value);

  @override
  AuthInputError? validator(String value) {
    if (value.isEmpty) {
      return EmptyTextError();
    } else if (!_isEmailValid(value)) {
      return InvalidEmailError();
    }
    return null;
  }

  bool _isEmailValid(String value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }
}

class PasswordInput extends FormzInput<String, AuthInputError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  PasswordInput dirty([String? value]) =>
      PasswordInput.dirty(value ?? this.value);

  @override
  AuthInputError? validator(String value) {
    if (value.isEmpty) {
      return EmptyTextError();
    } else if (value.length < 8) {
      return ShortPassword();
    } else if (!_isPasswordStrong(value)) {
      return WeakPasswordError();
    }
    return null;
  }

  bool _isPasswordStrong(String value) {
    final RegExp passwordRegex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~`!@#$%^&*()_+;:<>\{},.?-]).{8,}$');
    return passwordRegex.hasMatch(value);
  }
}

abstract class AuthInputError {}

class EmptyTextError extends AuthInputError {}

class InvalidEmailError extends AuthInputError {}

class WeakPasswordError extends AuthInputError {}

class ShortPassword extends AuthInputError {}

enum PlanNameValidationError { empty }

class PlanName extends FormzInput<String, PlanNameValidationError> {
  const PlanName.pure() : super.pure('');
  const PlanName.dirty([String value = '']) : super.dirty(value);

  @override
  PlanNameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PlanNameValidationError.empty;
  }
}

enum PlanDescriptionValidationError { empty }

class PlanDescription
    extends FormzInput<String, PlanDescriptionValidationError> {
  const PlanDescription.pure() : super.pure('');
  const PlanDescription.dirty([String value = '']) : super.dirty(value);

  @override
  PlanDescriptionValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : PlanDescriptionValidationError.empty;
  }
}
