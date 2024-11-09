import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:books/data/storage/shared_pref.dart';
import 'package:flutter/material.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenInitial()) {
    on<SplashRegCheckingEvent>(splashRegCheckingEvent);
  }

  FutureOr<void> splashRegCheckingEvent(
      SplashRegCheckingEvent event, Emitter<SplashscreenState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    var token = await SharedPref.getToken();
    if (token == null) {
      emit(SplashScreenNaviagateState(route: 'reg'));
    } else {
      emit(SplashScreenNaviagateState(route: 'home'));
    }
  }
}
