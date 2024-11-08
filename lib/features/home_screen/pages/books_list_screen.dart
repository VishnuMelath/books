import 'package:books/data/datamodels/book_model.dart';
import 'package:books/features/home_screen/widgets/book_grid.dart';
import 'package:books/features/home_screen/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = List.filled(20, 10);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          customTextField(label: 'search', controller: TextEditingController()),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .7,
                  crossAxisCount: MediaQuery.sizeOf(context).width >
                          MediaQuery.sizeOf(context).height
                      ? 5
                      : 2),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return bookGrid(BookModel(
                    id: 'id',
                    rating: 4.0,
                    title: 'Rich Dad Poor Dad',
                    coverPictureURL:
                        "https://pub-6dcd68c18727480ab1495dc1da3f5890.r2.dev/dev--Think",
                    description: 'description',
                    price: 480,
                    author: 'Robert T. Kiyosaki',
                    publishedDate: DateTime.now()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
