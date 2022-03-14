// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constance/const.dart';
import '../Controller/movie_controller.dart';

class BuildFavList extends StatelessWidget {
  MovieController controller = Get.find<MovieController>();
  BuildFavList(
      {Key? key, required this.image, required this.text, required this.id})
      : super(key: key);
  String image;
  String text;
  int id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primary, width: 0.5)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          height: 130,
                          width: 150,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changeFavorite(id);
                },
                child: Icon(
                  Icons.favorite,
                  color: primary,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
