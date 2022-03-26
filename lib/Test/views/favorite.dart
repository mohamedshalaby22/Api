// ignore_for_file: must_be_immutable

import 'package:fetch/Test/components/fav.dart';
import 'package:fetch/Test/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.white,
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
                  color: Colors.black,
                  size: 120,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'No Favourites Yet',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ));
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.favouriteList.length,
                      itemBuilder: (context, index) => FavoriteList(
                            image: controller.favouriteList[index].image
                                .toString(),
                            name: controller.favouriteList[index].title
                                .toString(),
                            id: controller.favouriteList[index].id.toString(),
                          )),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
