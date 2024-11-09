import 'package:books/core/utils/debouncer.dart';
import 'package:books/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget customSeachBar(BuildContext context) {
  Debouncer debouncer = Debouncer(500);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
    child: SizedBox(
      height: 35,
      child: TextField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          debouncer.call(
            () {
              context
                  .read<HomeScreenBloc>()
                  .add(HomeScreenSearchEvent(searchQuery: value));
            },
          );
        },
        cursorHeight: 15,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
      ),
    ),
  );
}
