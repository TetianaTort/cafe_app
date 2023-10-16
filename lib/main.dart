import 'package:cafe_app/home_screen.dart';
import 'package:cafe_app/model/settings.dart';
import 'package:cafe_app/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsModel(),
      child: Consumer<SettingsModel>(
        builder: (context, settingsModel, child) => MaterialApp(
          title: 'Cafe app',
          debugShowCheckedModeBanner: false,
          theme: settingsModel.isLightTheme ? CustomTheme.lightTheme : CustomTheme.darkTheme,
          // theme: CustomTheme.lightTheme,
          // darkTheme: CustomTheme.darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: settingsModel.locale,
          home: const HomeNavigation(),
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Cafe app',
  // debugShowCheckedModeBanner: false,
  // theme: CustomTheme.lightTheme,
  // darkTheme: CustomTheme.darkTheme,
  //     localizationsDelegates: const [
  //       AppLocalizations.delegate,
  //       GlobalMaterialLocalizations.delegate,
  //       GlobalWidgetsLocalizations.delegate,
  //       GlobalCupertinoLocalizations.delegate,
  //     ],
  //     supportedLocales: const [
  //       Locale('en'),
  //       Locale('uk'),
  //     ],
  //     home: const HomeNavigation(),
  //   );
  // }
}
