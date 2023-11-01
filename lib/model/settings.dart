import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  Locale? _locale;
  TextTheme? _textTheme;
  // bool _isLightTheme = true;

  Locale? get locale => _locale;
  TextTheme? get textTheam => _textTheme;
  // bool get isLightTheme => _isLightTheme;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void changeTheme(bool isLightTheme) {
    // _isLightTheme = isLightTheme;
    notifyListeners();
  }
}
