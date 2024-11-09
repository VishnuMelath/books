import 'package:books/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:books/features/home_screen/widgets/author_tile.dart';
import 'package:books/features/home_screen/widgets/loading_authors_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsListScreen extends StatelessWidget {
  const AuthorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenBloc homeScreenBloc = context.read<HomeScreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (previous, current) =>
            current is HomeScreenAuthorsLoadingState ||
            current is HomeScreenAuthorsLoadedState,
        builder: (context, state) {
          if (state is HomeScreenAuthorsLoadingState) {
            return loadingAuthorsTiles(context);
          }
          return ListView.builder(
            itemCount: homeScreenBloc.authorList.length,
            itemBuilder: (context, index) =>
                authorTile(homeScreenBloc.authorList[index]),
          );
        },
      ),
    );
  }
}
