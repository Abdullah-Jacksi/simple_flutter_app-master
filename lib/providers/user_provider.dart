import 'package:flutter/material.dart';
import 'package:simple_flutter_app/helper/locator.dart';
import 'package:simple_flutter_app/helper/prefs.dart';
import 'package:simple_flutter_app/models/user_model.dart';
import 'package:simple_flutter_app/network/apis.dart';
import 'package:simple_flutter_app/views/blog_list_view/blog_list_view.dart';
import 'package:simple_flutter_app/views/login_view/login_view.dart';
import 'package:simple_flutter_app/widgets/ui.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;

  String _email;
  String _password;
  String _errorMessage;

  set email(String email) {
    _email = email;
  }

  String get email => _email;

  set password(String password) {
    _password = password;
  }

  String get password => _password;

  set errorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  UserModel get user => _user;

  Future setLogin(GlobalKey<FormState> formKey, BuildContext context) async {
    if (errorMessage != null) errorMessage = null;
    if (formKey.currentState.validate()) {
      try {
        UiUtils.showLoading(context);
        user = await locator<Apis>().login(_email, _password);
        locator<Prefs>().saveLoginData(_email, _password);
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, BlogListView.NAME);
      } catch (_) {
        print(_);
        Navigator.pop(context);
        errorMessage = "there is an error";
      }
    }
  }

  void checkLogin(BuildContext context) async {
    if (locator<Prefs>().email != null && locator<Prefs>().password != null) {
      try {
        user = await locator<Apis>()
            .login(locator<Prefs>().email, locator<Prefs>().password);
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, BlogListView.NAME);
      } catch (_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, LoginView.NAME);
      }
    }
  }
}
