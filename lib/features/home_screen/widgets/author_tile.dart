import 'dart:math';

import 'package:books/core/themes/color_scemes.dart';
import 'package:books/data/datamodels/author_model.dart';
import 'package:flutter/material.dart';

Widget authorTile(AuthorModel author) {
  //genereate an random number inbetween 0 to list length
  var randomIndex = Random().nextInt(lightColorsList.length);
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26, width: 0.3)),
    child: ListTile(
      contentPadding: const EdgeInsets.only(left: 10, right: 5),
      minLeadingWidth: 0,
      horizontalTitleGap: 10,
      leading: CircleAvatar(
        backgroundColor: lightColorsList[randomIndex],
        child: Text(
          getFirstLetter(author.name),
          style: TextStyle(color: denseColorsList[randomIndex]),
        ),
      ),
      title: Text(
        author.name,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        author.biography,
        maxLines: 2,
        style: const TextStyle(fontSize: 11),
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

String getFirstLetter(String name) {
  return name.split(' ').firstWhere(
        (element) => !element.contains('.'),
      )[0];
}
