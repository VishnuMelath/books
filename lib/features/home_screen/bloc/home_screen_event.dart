part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class HomeScreenBooksLoadingEvent extends HomeScreenEvent {}

class HomeScreenAuthorLoadingEvent extends HomeScreenEvent {}
