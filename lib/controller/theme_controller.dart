import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends ChangeNotifier {
  final box = GetStorage();
  bool get isDarkMode => box.read('darkmode') ?? false;
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme(bool val) {
    box.write('darkmode', val);
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: const Color(0xff71B2AB),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    scaffoldBackgroundColor: const Color(0xff3B3C46),
    iconTheme: const IconThemeData(color: Colors.white),
    cardColor: Colors.black,
  );

  static final lightTheme = ThemeData(
    backgroundColor: const Color.fromARGB(255, 249, 250, 255),
    primaryColor: const Color(0xff71B2AB),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 249, 250, 255),
      iconTheme: IconThemeData(
          color: Colors.black
      ),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 249, 250, 255),
    iconTheme: const IconThemeData(color: Colors.black),
    cardColor: Colors.white,
  );
}