import 'package:cafe_app/home_screen.dart';
import 'package:cafe_app/model/settings.dart';
import 'package:cafe_app/utils/custom_theme.dart';
import 'package:cafe_app/utils/data_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyAppWrapper());
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsModel(),
      child: Consumer<SettingsModel>(
        builder: (context, settingsModel, child) => MaterialApp(
          title: 'Cafe app',
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.of(context),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: settingsModel.locale,
          home: const HomeNavigation(),
        ),
      ),
    );
  }
}
