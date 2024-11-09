import 'package:books/features/book_details_screen/bloc/book_details_bloc.dart';
import 'package:books/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:books/features/register_screen/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RatingBottomSheet extends StatefulWidget {
  final BookDetailsBloc bookDetailsBloc;
  const RatingBottomSheet({super.key, required this.bookDetailsBloc});

  @override
  State<RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  late int _rating;

  @override
  void initState() {
    _rating = widget.bookDetailsBloc.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gray line at top
          Container(
            width: 30,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const Text(
            'Add rating',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),
          const Divider(
            thickness: 0.1,
            color: Colors.black38,
          ),
          const SizedBox(height: 10),
          // Star Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    index < _rating ? Icons.star : Icons.star,
                    size: 40,
                    color: index < _rating ? Colors.amber : Colors.grey,
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 10),
          const Divider(
            thickness: 0.1,
            color: Colors.black38,
          ),
          const SizedBox(height: 10),

          // Submit Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _rating > 0
                  ? () {
                      widget.bookDetailsBloc
                        ..rating = _rating
                        ..add(BookAddRatingEvent(rating: _rating));
                      context.pop();
                    }
                  : () {
                      showCustomSnackbar(context,
                          'Please give a rating before submitting!', false);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
        ],
      ),
    );
  }
}

// Function to show the bottom sheet
void showRatingSheet(BuildContext context,
    {required BookDetailsBloc bookDetailsBloc}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => RatingBottomSheet(
      bookDetailsBloc: bookDetailsBloc,
    ),
  );
}
