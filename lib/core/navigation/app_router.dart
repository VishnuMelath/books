import 'package:books/data/datamodels/book_model.dart';
import 'package:books/features/book_details_screen/pages/book_details_page.dart';
import 'package:books/features/home_screen/pages/bottom_nav_screen.dart';
import 'package:books/features/register_screen/pages/register_screen.dart';
import 'package:books/features/splash_screen/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: '/registration',
        builder: (BuildContext context, GoRouterState state) =>
            const RegistrationFormPage(),
      ),
      GoRoute(
        path: '/bottomnav',
        builder: (BuildContext context, GoRouterState state) =>
            const BottomNavScreen(),
      ),
      GoRoute(
        path: '/bookdetails',
        builder: (context, state) {
          final book = state.extra as BookModel;
          return BookDetailPage(book: book);
        },
      ),
    ],
  );
}
