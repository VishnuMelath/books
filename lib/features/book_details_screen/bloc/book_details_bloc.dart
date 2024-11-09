import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:books/data/datamodels/book_model.dart';
import 'package:books/data/repository/books_repository.dart';
import 'package:meta/meta.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  late BookModel book;
  int rating = 0;
  BookDetailsBloc() : super(BookDetailsInitial()) {
    on<BookAddRatingEvent>(bookAddRatingEvent);
  }

  FutureOr<void> bookAddRatingEvent(
      BookAddRatingEvent event, Emitter<BookDetailsState> emit) async {
    log('event called');
    try {
      book = await BooksRepository().addRating(book, event.rating);
      emit(BookReviewAddedState());
    } on SocketException {
      emit(BookDetailsErrorState(
          errorMsg: 'Network error!Please check your network and try again'));
    } catch (e) {
      emit(BookDetailsErrorState(errorMsg: e.toString()));
    }
  }
}
