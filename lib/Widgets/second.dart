// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constance/const.dart';
import '../Controller/movie_controller.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController controller = Get.find<MovieController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Obx(() {
          if (controller.favouriteList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                    size: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Favourites Yet',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.favouriteList.length,
                      itemBuilder: (context, index) => BuildFavList(
                          image: 'https://image.tmdb.org/t/p/w500' +
                              controller.favouriteList[index].poster_path
                                  .toString(),
                          text: controller.favouriteList[index].original_title
                              .toString(),
                          id: controller.favouriteList[index].id!.toInt())),
                )
              ],
            );
          }
        }),
      ),
    );
  }
}

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
