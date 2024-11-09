part of 'book_details_bloc.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

class BookDetailsErrorState extends BookDetailsState {
  final String errorMsg;

  BookDetailsErrorState({required this.errorMsg});
}

class BookReviewAddedState extends BookDetailsState {}
