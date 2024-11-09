import 'dart:developer';

import 'package:books/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:books/features/home_screen/widgets/book_grid.dart';
import 'package:books/features/home_screen/widgets/custom_alertdialogue.dart';
import 'package:books/features/home_screen/widgets/custom_search_bar.dart';
import 'package:books/features/home_screen/widgets/loading_grids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    HomeScreenBloc homeScreenBloc = context.read<HomeScreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Books',
        ),
      ),
      body: Column(
        children: [
          customSeachBar(context),
          BlocConsumer<HomeScreenBloc, HomeScreenState>(
            buildWhen: (previous, current) =>
                current is HomeScreenBooksLoadingState ||
                current is HomeScreenBooksLoadedState,
            listener: (context, state) {
              if (state is HomeScreenErrorState) {
                showRetryConfirmation(context, state.errorMsg);
              }
            },
            builder: (context, state) {
              log(state.runtimeType.toString());
              if (state is HomeScreenBooksLoadingState) {
                return loadingGrids(context);
              }
              if (homeScreenBloc.showingBooks.isEmpty) {
                return const Expanded(
                    child: Center(
                  child: Text('Books not found'),
                ));
              }
              return Expanded(
                child: GridView.builder(
                  controller: controller,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .7,
                      crossAxisCount: MediaQuery.sizeOf(context).width >
                              MediaQuery.sizeOf(context).height
                          ? 5
                          : 2),
                  itemCount: homeScreenBloc.showingBooks.length,
                  itemBuilder: (context, index) {
                    return bookGrid(
                        context, homeScreenBloc.showingBooks[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
