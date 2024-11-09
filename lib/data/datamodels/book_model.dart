import 'dart:developer';

import 'package:books/core/utils/date_convert.dart';

class BookModel {
  final String id;
  final String title;
  final String description;
  final int price;
  String author;
  final String coverPictureURL;
  final String publishedDate;
  final List<double> rating;

  BookModel(
      {required this.id,
      required this.title,
      required this.coverPictureURL,
      required this.description,
      required this.price,
      required this.author,
      required this.rating,
      required this.publishedDate});

  factory BookModel.fromJson(Map<String, dynamic> data) {
    log(data['ratings'].toString());
    log(data['price'].runtimeType.toString());
    return BookModel(
        id: data['id'],
        title: data['title'],
        coverPictureURL: data['coverPictureURL'],
        description: data['description'],
        price: data['price'],
        author: data['authorId'],
        rating: [
          ...data['ratings'].map((val) {
            log(val['rating'].runtimeType.toString());
            return val['rating'].toDouble();
          })
        ],
        publishedDate: dateToMMDDYYConvert(data['publishedDate']));
  }
}
