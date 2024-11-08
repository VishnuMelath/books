part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterButtonPressedEvent extends RegisterEvent {
  final String userName;
  final String password;

  RegisterButtonPressedEvent({required this.userName, required this.password});
}
