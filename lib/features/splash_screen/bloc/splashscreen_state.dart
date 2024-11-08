part of 'splashscreen_bloc.dart';

@immutable
sealed class SplashscreenState {}

final class SplashscreenInitial extends SplashscreenState {}

class SplashScreenErrorState extends SplashscreenState {
  final String errorMsg;
  SplashScreenErrorState({required this.errorMsg});
}

class SplashScreenNaviagateState extends SplashscreenState {
  final String route;

  SplashScreenNaviagateState({required this.route});
}
