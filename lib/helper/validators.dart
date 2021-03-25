import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:simple_flutter_app/helper/constants.dart';

class Validators {
  static MultiValidator getEmailValidator(BuildContext context) {
    return MultiValidator([
      RequiredValidator(errorText: "E-mail"),
      PatternValidator(
        Constants.EMAIL_REGEX,
        errorText: "Enter a valid email address",
      ),
    ]);
  }

  static MultiValidator getPasswordValidator(BuildContext context) {
    return MultiValidator([
      RequiredValidator(
        errorText: "password is required",
      ),
      MinLengthValidator(
        8,
        errorText: "Password must be at least eight characters long",
      ),
      PatternValidator(
        Constants.PASSWORD_REGEX,
        errorText: Constants.passwordErrorText,
      )
    ]);
  }
}
