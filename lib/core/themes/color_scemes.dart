import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  primary: Color.fromARGB(255, 249, 103, 20),
  primaryContainer: Color.fromARGB(255, 255, 255, 255),
  secondary: Color.fromARGB(255, 3, 121, 218),
  secondaryContainer: Color(0xFF018786),
  surface: Color(0xFFFFFFFF),
  error: Color(0xFFB00020),
  onPrimary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFF000000),
  onSurface: Color(0xFF000000),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.light,
);

const darkColorScheme = ColorScheme(
  primary: Color.fromARGB(255, 249, 103, 20),
  primaryContainer: Color(0xFF3700B3),
  secondary: Color(0xFF03DAC6),
  secondaryContainer: Color(0xFF03DAC6),
  surface: Color(0xFF121212),
  error: Color(0xFFCF6679),
  onPrimary: Color(0xFF000000),
  onSecondary: Color(0xFF000000),
  onSurface: Color(0xFFFFFFFF),
  onError: Color(0xFF000000),
  brightness: Brightness.dark,
);
