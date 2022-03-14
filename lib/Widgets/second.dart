// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/favourite_list.dart';
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
