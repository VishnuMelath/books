// core/theme/text_styles.dart

import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  static const TextStyle title = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextTheme textTheme = TextTheme(
    headlineMedium: headline1,
    bodyMedium: bodyText1,
  );
}
