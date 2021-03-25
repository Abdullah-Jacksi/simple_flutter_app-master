import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key key,
      this.onValidate,
      this.formKey,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      this.obscureText = false,
      this.hintText = ""})
      : super(key: key);
  final Function onValidate;
  final GlobalKey<FormState> formKey;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Function onChanged;
  final Function onSubmitted;
  final String hintText;
  final FocusNode focusNode;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      validator: onValidate,
      autofocus: true,
      textInputAction: inputAction,
      keyboardType: inputType,
      obscureText: obscureText,
      onChanged: onChanged ??
          (_) {
            if (formKey != null) formKey.currentState.validate();
          },
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: hintText),
    );
  }
}
