import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_app/helper/validators.dart';
import 'package:simple_flutter_app/models/user_model.dart';
import 'package:simple_flutter_app/providers/user_provider.dart';
import 'package:simple_flutter_app/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _passwordNode = FocusNode();
  static const NAME = "/login_view";

  @override
  Widget build(BuildContext context) {
    final textFieldHeight = MediaQuery.of(context).size.height * 0.06;
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in Screen'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  textFieldEmail(context, textFieldHeight),
                  SizedBox(
                    height: 32,
                  ),
                  textFieldPassword(context, textFieldHeight),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Log In"),
                      onPressed: () async {
                        await Provider.of<UserProvider>(context, listen: false)
                            .setLogin(_formKey, context);
                      },
                    ),
                  ),
                  if (Provider.of<UserProvider>(
                        context,
                      ).errorMessage !=
                      null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        Provider.of<UserProvider>(
                          context,
                        ).errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldEmail(context, height) {
    return Container(
      height: height,
      child: AppTextField(
        hintText: "Enter your email",
        onValidate: Validators.getEmailValidator(context),
        inputType: TextInputType.emailAddress,
        onChanged: (value) {
          Provider.of<UserProvider>(context, listen: false).email = value;
          _formKey.currentState.validate();
        },
        onSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordNode),
      ),
    );
  }

  Widget textFieldPassword(context, height) {
    return Container(
      height: height,
      child: AppTextField(
        focusNode: _passwordNode,
        onValidate: Validators.getPasswordValidator(context),
        inputAction: TextInputAction.done,
        inputType: TextInputType.text,
        hintText: "Enter your password",
        onChanged: (value) {
          Provider.of<UserProvider>(context, listen: false).password = value;
          _formKey.currentState.validate();
        },
        obscureText: true,
        onSubmitted: (_) async {
          await Provider.of<UserProvider>(context, listen: false)
              .setLogin(_formKey, context);
        },
      ),
    );
  }
}
