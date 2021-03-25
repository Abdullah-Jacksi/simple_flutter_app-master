import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_app/helper/constants.dart';

class Prefs {
  SharedPreferences _prefs;

  String get email => _prefs.get(Constants.EMAIL_KEY);
  set email(String value) => _prefs.setString(Constants.EMAIL_KEY, value);

  String get password => _prefs.get(Constants.PASSWORD_KEY);
  set password(String value) => _prefs.setString(Constants.PASSWORD_KEY, value);

  setSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveLoginData(String email, String password) {
    this.password = password;
    this.email = email;
  }
}
