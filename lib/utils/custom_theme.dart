import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//main themes

enum MyThemeKeys {
  light,
  dark,
}

class CustomThemes {
  static ThemeData get lightTheme {
    var kColorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 96, 59, 181),
    );
    return ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        titleLarge: const TextStyle(
          fontSize: 33,
          color: Colors.brown,
        ),
        bodySmall: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.brown,
          ),
        ),
        bodyMedium: GoogleFonts.oswald(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 129, 104, 95),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    var kDarkColorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 5, 99, 125),
    );
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        titleLarge: const TextStyle(
          fontSize: 33,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        bodyMedium: GoogleFonts.oswald(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 201, 201, 201),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.light:
        return lightTheme;
      case MyThemeKeys.dark:
        return darkTheme;
    }
  }
}
