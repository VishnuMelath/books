import 'dart:math';

import 'package:books/core/themes/color_scemes.dart';
import 'package:books/core/utils/avg_rating.dart';
import 'package:books/data/datamodels/book_model.dart';
import 'package:books/features/book_details_screen/widgets/custom_bottom_sheet.dart';
import 'package:books/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:books/features/register_screen/widgets/custom_snackbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/book_details_bloc.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;
  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    BookDetailsBloc bookDetailsBloc = BookDetailsBloc()..book = book;
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocConsumer<BookDetailsBloc, BookDetailsState>(
        bloc: bookDetailsBloc,
        listener: (context, state) {
          if (state is BookDetailsErrorState) {
            showCustomSnackbar(context, state.errorMsg, false);
          } else if (state is BookReviewAddedState) {
            showCustomSnackbar(context, 'Review added succesfully');
            context.read<HomeScreenBloc>().add(HomeScreenBooksLoadingEvent());
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SizedBox(
                child: ListView(
                  children: [
                    _buildProductImage(screenHeight, screenWidth),
                    _buildProductDetails(bookDetailsBloc),
                    _buildProductDescription(),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildPriceAndRating(
                      screenWidth, context, bookDetailsBloc)),
            ],
          );
        },
      ),
    );
  }

//Image
  Widget _buildProductImage(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.35,
      width: screenWidth,
      color: lightColorsList[Random().nextInt(lightColorsList.length)],
      padding: const EdgeInsets.all(20),
      child: CachedNetworkImage(
        imageUrl: book.coverPictureURL,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildProductDetails(BookDetailsBloc bookDetailsBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductTitle(bookDetailsBloc),
                _buildAuthorName(),
                const SizedBox(height: 5.0),
                _buildPublishedDate(),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }

  Widget _buildProductTitle(BookDetailsBloc bookDetailsBloc) {
    return Row(
      children: [
        Expanded(
          child: Text(
            book.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildRatingWidget(bookDetailsBloc),
      ],
    );
  }

//!author name
  Widget _buildAuthorName() {
    return const Text(
      'by Robert T.Kiyosaki',
      style: TextStyle(
        fontSize: 12.0,
      ),
    );
  }

//! PUBLISH
  Widget _buildPublishedDate() {
    return Text(
      'Published date: ${book.publishedDate}',
      style: const TextStyle(
        fontSize: 11.0,
        color: Colors.black54,
        fontWeight: FontWeight.w400,
      ),
    );
  }

//! RATING
  Widget _buildRatingWidget(BookDetailsBloc bookDetailsBloc) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 255, 205, 43),
              size: 15,
            ),
            Text(
              getAvgRating(bookDetailsBloc.book.rating),
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

//! DESCRIPTION
  Widget _buildProductDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        softWrap: true,
        book.description,
        style: const TextStyle(
          fontSize: 13.0,
          color: Colors.black87,
        ),
      ),
    );
  }

//!  PRICE
  Widget _buildPriceAndRating(double screenWidth, BuildContext context,
      BookDetailsBloc bookDetailsBloc) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: .3),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
        child: Row(
          children: [
            Text(
              '₹ ${book.price}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            _buildAddRatingButton(screenWidth, context, bookDetailsBloc),
          ],
        ),
      ),
    );
  }

//! SCAFOLD BUTTON
  Widget _buildAddRatingButton(double screenWidth, BuildContext context,
      BookDetailsBloc bookDetailsBloc) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        style: const ButtonStyle(
            padding:
                WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12))),
        onPressed: () {
          showRatingSheet(context, bookDetailsBloc: bookDetailsBloc);
          // _showRatingBottomSheet(screenWidth);
        },
        child: const Text(
          'Add Rating',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
