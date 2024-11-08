// core/theme/app_theme.dart

import 'package:books/utils/themes/color_scemes.dart';
import 'package:books/utils/themes/text_styles.dart';
import 'package:flutter/material.dart';

import 'theme_constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    primaryColor: lightColorScheme.primary,
    textTheme: AppTextStyles.textTheme,
    appBarTheme: AppBarTheme(
      color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      iconTheme: IconThemeData(color: lightColorScheme.onPrimary),
      titleTextStyle: AppTextStyles.title,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeConstants.buttonRadius),
          )),
          foregroundColor:
              WidgetStatePropertyAll(lightColorScheme.primaryContainer),
          textStyle: WidgetStatePropertyAll(TextStyle(
            color: lightColorScheme.primaryContainer,
          )),
          backgroundColor: WidgetStatePropertyAll(lightColorScheme.primary)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: lightColorScheme.primary,
      labelStyle: const TextStyle(),
      isDense: true,
      hintStyle: const TextStyle(
          color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.3, color: Colors.black38),
        borderRadius: BorderRadius.circular(AppThemeConstants.buttonRadius),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black38),
        borderRadius: BorderRadius.circular(AppThemeConstants.buttonRadius),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: lightColorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black38),
        borderRadius: BorderRadius.circular(AppThemeConstants.buttonRadius),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    primaryColor: darkColorScheme.primary,
    textTheme: AppTextStyles.textTheme,
    inputDecorationTheme: InputDecorationTheme(
        focusColor: lightColorScheme.primary,
        labelStyle: const TextStyle(),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppThemeConstants.buttonRadius))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeConstants.buttonRadius),
          )),
          textStyle: WidgetStatePropertyAll(TextStyle(
            color: lightColorScheme.primaryContainer,
          )),
          backgroundColor: WidgetStatePropertyAll(lightColorScheme.primary)),
    ),
    appBarTheme: AppBarTheme(
      color: const Color.fromARGB(255, 0, 0, 0),
      elevation: 0,
      iconTheme: IconThemeData(color: darkColorScheme.onPrimary),
      titleTextStyle: AppTextStyles.title,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppThemeConstants.buttonRadius),
      ),
    ),
  );
}