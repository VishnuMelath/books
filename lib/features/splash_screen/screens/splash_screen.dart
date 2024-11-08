import 'package:books/features/home_screen/pages/bottom_nav_screen.dart';
import 'package:books/features/register_screen/pages/register_screen.dart';
import 'package:books/features/register_screen/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splashscreen_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orange[300]!, Colors.orange[700]!])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocListener<SplashscreenBloc, SplashscreenState>(
          bloc: SplashscreenBloc()..add(SplashRegCheckingEvent()),
          listener: (context, state) {
            if (state is SplashScreenNaviagateState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => state.route == 'reg'
                        ? const RegistrationForm()
                        : const BottomNavScreen(),
                  ));
            }
          },
          child: Center(
            child: customIconWidget(),
          ),
        ),
      ),
    );
  }
}
