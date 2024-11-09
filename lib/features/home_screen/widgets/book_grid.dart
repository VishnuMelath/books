import 'package:books/core/utils/avg_rating.dart';
import 'package:books/data/datamodels/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../book_details_screen/pages/book_details_page.dart';

Widget bookGrid(BuildContext context, BookModel book) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(book: book),
          ));
    },
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(border: Border.all(width: 0.2, color: Colors.black12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Center(
                  child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: CachedNetworkImage(
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                      baseColor: Colors.orange[50]!,
                      highlightColor: Colors.orange[100]!,
                      child: const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                      ));
                },
                imageUrl: book.coverPictureURL),
          ))),
          Text(
            book.title,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w500),
          ),
          Text(
            book.author,
            overflow: TextOverflow.fade,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber[300]!,
                size: 11,
              ),
              Text(
                getAvgRating(book.rating),
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Text(
            '\$${book.price}',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  );
}
