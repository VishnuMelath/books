import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:books/data/datamodels/author_model.dart';
import 'package:books/data/datamodels/book_model.dart';
import 'package:books/data/repository/books_repository.dart';
import 'package:flutter/material.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  List<BookModel> allBooks = [];
  List<BookModel> showingBooks = [];
  List<AuthorModel> authorList = [];

  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenBooksLoadingEvent>(homeScreenBooksLoadingEvent);
    on<HomeScreenSearchEvent>(homeScreenSearchEvent);
    on<HomePaginationEvent>(homePaginationEvent);
  }

  FutureOr<void> homeScreenBooksLoadingEvent(
      HomeScreenBooksLoadingEvent event, Emitter<HomeScreenState> emit) async {
    try {
      emit(HomeScreenBooksLoadingState());
      allBooks = await BooksRepository().getAllBooks();
      emit(HomeScreenAuthorsLoadingState());
      authorList = await BooksRepository().getAllAuthors();
      emit(HomeScreenAuthorsLoadedState());
      for (var element in allBooks) {
        element.author = authorList
            .firstWhere(
              (author) => element.author == author.id,
            )
            .name;
      }
      showingBooks = allBooks;
      emit(HomeScreenBooksLoadedState());
    } on SocketException {
      log('socket exception');
      emit(HomeScreenErrorState(
          errorMsg: 'Network error!Check you network and try again'));
    } catch (e) {
      emit(HomeScreenErrorState(
          errorMsg: 'Something went wrong please try again'));
    }
  }

  FutureOr<void> homeScreenSearchEvent(
      HomeScreenSearchEvent event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenBooksLoadingState());
    showingBooks = [
      ...allBooks.where(
        (element) => element.title
            .toLowerCase()
            .contains(event.searchQuery.toLowerCase()),
      )
    ];
    emit(HomeScreenBooksLoadedState());
  }

  FutureOr<void> homePaginationEvent(
      HomePaginationEvent event, Emitter<HomeScreenState> emit) async {
    //just to show pagination effect since the api doesnt have that much of data.
    await Future.delayed(const Duration(seconds: 1));
    showingBooks.addAll(showingBooks.take(8));
    emit(HomeScreenBooksLoadedState());
  }
}
