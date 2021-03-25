class Constants {
  //Prefs Keys
  static const TOKEN_KEY = "LogInToken";
  static const PASSWORD_KEY = "LogInPassword";
  static const EMAIL_KEY = "LogInEmail";

  //Regex
  static const EMAIL_REGEX =
      '''([-!#-'*+/-9=?A-Z^-~]+(\.[-!#-'*+/-9=?A-Z^-~]+)*|"([]!#-[^-~ \t]|(\\[\t -~]))+")@[0-9A-Za-z]([0-9A-Za-z-]{0,61}[0-9A-Za-z])?(\.[0-9A-Za-z]([0-9A-Za-z-]{0,61}[0-9A-Za-z])?)+''';
  static const PASSWORD_REGEX =
      '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$';

  static const passwordErrorText =
      'Password must contain at least one upper case, one lower case,\none digit, one special character and must be minimum eight characters long';
}
