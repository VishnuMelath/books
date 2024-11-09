import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:books/data/repository/authentication_repository.dart';
import 'package:books/data/storage/shared_pref.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressedEvent>(registerButtonPressedEvent);
  }

  FutureOr<void> registerButtonPressedEvent(
      RegisterButtonPressedEvent event, Emitter<RegisterState> emit) async {
    try {
      log('called');
      var token = await AuthRepository()
          .registerUser(userName: event.userName, password: event.password);
      await SharedPref.saveToken(token);
      emit(RegisterSuccessState());
    } on SocketException {
      emit(RegisterErrorState(
          errorMsg: 'Network error! Check your network and try again'));
    } catch (e) {
      emit(RegisterErrorState(errorMsg: e.toString()));
    }
  }
}
