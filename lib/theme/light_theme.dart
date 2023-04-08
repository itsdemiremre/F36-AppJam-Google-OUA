import 'package:flutter/material.dart';

class LightTheme {

  final _lightColor = _LightColor();
late ThemeData theme;

LightTheme(){
  theme  = ThemeData(
bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFFF8F8F8)),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF8F8F8), shadowColor: Colors.black.withOpacity(0.25),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(11)))),
  scaffoldBackgroundColor: Colors.white12.withOpacity(0.8), 
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _lightColor._fabColor),

  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.light(onPrimary: _lightColor._buttonColor,onSecondary: _lightColor._generalColor)),
  colorScheme: ColorScheme.light(),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.tealAccent), side: BorderSide(color: Colors.grey)),
  textTheme: 
  ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 20,color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = Color.fromARGB(255, 0, 0, 0); 
  final Color _buttonColor = Color.fromARGB(255, 67, 178, 113);
  final Color _fabColor = Colors.green;
  final Color _generalColor = Color.fromARGB(255, 204, 128, 14);
}