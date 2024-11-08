import 'package:books/features/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'utils/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const RegistrationForm(),
    );
  }
}
