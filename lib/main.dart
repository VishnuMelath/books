import 'package:books/core/navigation/app_router.dart';
import 'package:books/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Books',
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme, //its not complete
      ),
    );
  }
}
