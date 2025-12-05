import 'package:flutter/material.dart';
import 'package:stylish/Core/theme/dark_theme.dart';
import 'package:stylish/Core/theme/light_theme.dart';

abstract class AppThemes {
  static ThemeData get getLightTheme => lightTheme;
  static ThemeData get getDarkTheme => darkTheme;
}