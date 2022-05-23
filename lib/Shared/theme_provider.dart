import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class ThemeModes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF202020),
    //primaryColor: Color(0xFFE6E6E6),
    primarySwatch: Colors.blue,
    //appBarTheme: AppBarTheme(backgroundColor: Color(0xFFE6E6E6)),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueAccent,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFE6E6E6),
    //primaryColor: Colors.lightBlueAccent,
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.light(
      primary: Colors.blueAccent,
    ),
  );
}
