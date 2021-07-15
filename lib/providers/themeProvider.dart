import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static List validEmail = ['cbristow@aictitle.com'];
  static Color primaryBackgroundColor = Color.fromRGBO(249, 249, 249, 1);
  static Color primaryAppBarBackground = Color.fromRGBO(22, 26, 43, 1.0);
  static Color primaryIconColor = Color.fromRGBO(66, 71, 96, 1.0);
  static Color primaryAccentRed = Color.fromRGBO(212, 88, 93, 1.0);
  static Color primaryColor = Color.fromRGBO(27, 54, 100, 1.0);
  static Color secondaryColor = Color.fromRGBO(242, 168, 29, 1.0);
  static Color primaryAccent = Color.fromRGBO(221, 64, 64, 1.0);
  static Color secondaryAccent = Color.fromRGBO(255, 167, 0, 1.0);
  static Color primaryTextColor = Colors.white;
  static Color bodyTextColor = Color.fromRGBO(166, 168, 208, 1.0);
  static Color secondaryTextColor = Color.fromRGBO(116, 138, 157, 1.0);
  static Color thirdAccent = Color.fromRGBO(139, 195, 217, 1.0);
  static Color secondaryButton = Color.fromRGBO(240, 244, 248, 1.0);

  static Color primaryCardColor = Color.fromRGBO(255, 255, 255, 1);

  bool _darkMode = true;

  get getDarkMode => _darkMode;

  void setDarkMode(value) {
    if (value == true) {
      this._darkMode = true;
      primaryCardColor = Color.fromRGBO(78, 93, 106, 1.0);
      secondaryTextColor = Color.fromRGBO(166, 188, 208, 1.0);
    } else {
      this._darkMode = false;
      primaryCardColor = Colors.white;
    }
    notifyListeners();
  }

  get getTheme => _darkMode ? ThemeData.dark() : ThemeData.light();

  bool _obscurePass = true;

  set setObscurePass(bool input) {
    if (input == true) {
      _obscurePass = true;
      notifyListeners();
    } else {
      _obscurePass = false;
      notifyListeners();
    }
  }

  get obscurePass => _obscurePass;

  bool _isValid = false;

  set setEmailInput(String input) {
    if (input == validEmail[0]) {
      _isValid = true;
      notifyListeners();
    } else {
      _isValid = false;
      notifyListeners();
    }
  }

  bool get isValid => _isValid;

  bool _isLoading = false;

  get getIsLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
