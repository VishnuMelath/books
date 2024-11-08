part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

class HomeScreenBooksLoadingState extends HomeScreenState {}

class HomeScreenErrorState extends HomeScreenState {
  final String errorMsg;

  HomeScreenErrorState({required this.errorMsg});
}

class HomeScreenBooksLoadedState extends HomeScreenState {}

class HomeScreenAuthorsLoadingState extends HomeScreenState {}

class HomeScreenAuthorsLoadedState extends HomeScreenState {}
