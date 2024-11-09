import 'dart:convert';
import 'dart:developer';

import 'package:books/core/network/api_endpoints.dart';
import 'package:books/data/datamodels/author_model.dart';
import 'package:books/data/datamodels/book_model.dart';
import 'package:books/data/storage/shared_pref.dart';
import 'package:http/http.dart' as http;

class BooksRepository {
  Future<List<BookModel>> getAllBooks() async {
    try {
      var responce = await http.get(Uri.parse(ApiEndpoints.getBookEndPoint));
      var result = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        List books = result['result'];
        return books.map(
          (e) {
            return BookModel.fromJson(e);
          },
        ).toList();
      } else {
        throw (result['message']);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<AuthorModel>> getAllAuthors() async {
    try {
      var responce =
          await http.get(Uri.parse(ApiEndpoints.getAuthorsListEndPoint));
      var result = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        List authors = result['result'];
        return authors.map(
          (e) {
            return AuthorModel.fromJson(e);
          },
        ).toList();
      } else {
        throw (result['message']);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<BookModel> addRating(BookModel book, int rating) async {
    try {
      var jwtToken = await SharedPref.getToken();
      var header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      };
      log(jwtToken.toString());
      var responce1 = await http.get(
        Uri.parse(
          ApiEndpoints.getBookByIDEndPoint(book.id),
        ),
      );
      var result = jsonDecode(responce1.body);
      List ratings = result['result']['ratings'];
      ratings.add({'userId': '7f8da2e7e36b5415', 'rating': rating});
      log(ratings.toString());
      var responce = await http.patch(
          Uri.parse(
            ApiEndpoints.addRatingEndPoint(book.id),
          ),
          headers: header,
          body: jsonEncode({'ratings': ratings}));
      log(responce.body.toString());
      if (responce.statusCode == 200) {
        return BookModel.fromJson(jsonDecode(responce.body)['result']);
      } else {
        throw ('Somethings went wrong');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<BookModel> getBookById(String bookID) async {
    try {
      var responce = await http.get(
        Uri.parse(
          ApiEndpoints.getBookByIDEndPoint(bookID),
        ),
      );
      // log(responce.body.toString());
      return BookModel.fromJson(jsonDecode(responce.body)['result']);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
