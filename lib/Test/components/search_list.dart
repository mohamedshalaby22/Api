// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  SearchList({
    Key? key,
    required this.image,
  }) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
