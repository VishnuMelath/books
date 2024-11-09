part of 'book_details_bloc.dart';

@immutable
sealed class BookDetailsEvent {}

class BookAddRatingEvent extends BookDetailsEvent {
  final int rating;

  BookAddRatingEvent({required this.rating});
}
