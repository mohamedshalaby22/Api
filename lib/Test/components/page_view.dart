// ignore_for_file: must_be_immutable

import 'package:fetch/Test/components/components.dart';
import 'package:flutter/material.dart';

class PageViewList extends StatelessWidget {
  PageViewList({
    Key? key,
    required this.image,
    required this.title,
    required this.name,
  }) : super(key: key);
  String image;
  String title;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffe5f0f3)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: name,
                      size: 18,
                    ),
                    DefaultText1(
                      text: title,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: const Text('Shop Now',
                        style: TextStyle(color: Colors.white))),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade100,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(image))),
            )
          ],
        ),
      ),
    );
  }
}
