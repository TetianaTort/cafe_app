import 'package:cafe_app/my_app.dart';
import 'package:cafe_app/utils/custom_theme.dart';
import 'package:cafe_app/utils/data_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyAppWrapper()));
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTheme(
      initialThemeKey: MyThemeKeys.light,
      child: MyApp(),
    );
  }
}
