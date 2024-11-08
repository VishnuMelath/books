import 'package:flutter/material.dart';

Widget customIconWidget() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.4,
          color: Colors.black12,
        )),
    child: Image.asset(
      'assets/book_icon.png',
      width: 70,
      height: 70,
    ),
  );
}
