import 'package:cafe_app/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class _CustomTheme extends InheritedWidget {
  final CustomThemeState data;
  final MyThemeKeys themeKey;

  const _CustomTheme({
    required this.themeKey,
    required this.data,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CustomTheme oldWidget) {
    return true;
  }
}

class CustomTheme extends StatefulWidget {
  final Widget child;
  final MyThemeKeys initialThemeKey;

  const CustomTheme({
    Key? key,
    required this.initialThemeKey,
    required this.child,
  }) : super(key: key);

  @override
  CustomThemeState createState() => CustomThemeState();

  static ThemeData? of(BuildContext context) {
    _CustomTheme? inherited = context.dependOnInheritedWidgetOfExactType<_CustomTheme>();
    return inherited?.data.theme;
  }

  static CustomThemeState? instanceOf(BuildContext context) {
    _CustomTheme? inherited = context.dependOnInheritedWidgetOfExactType<_CustomTheme>();
    return inherited?.data;
  }
}

class CustomThemeState extends State<CustomTheme> {
  late ThemeData _theme;
  late MyThemeKeys themeKey;

  ThemeData get theme => _theme;

  @override
  void initState() {
    themeKey = widget.initialThemeKey;
    _theme = CustomThemes.getThemeFromKey(widget.initialThemeKey);
    super.initState();
  }

  bool isLight() {
    return themeKey == MyThemeKeys.light ? false : true;
  }

  void changeTheme(bool isLight) {
    setState(() {
      if (!isLight) {
        themeKey = MyThemeKeys.light;
        _theme = CustomThemes.getThemeFromKey(MyThemeKeys.light);
      } else {
        themeKey = MyThemeKeys.dark;
        _theme = CustomThemes.getThemeFromKey(MyThemeKeys.dark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CustomTheme(
      data: this,
      themeKey: themeKey,
      child: widget.child,
    );
  }
}
