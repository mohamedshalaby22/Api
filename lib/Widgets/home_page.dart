import 'package:fetch/Controller/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController controller = Get.find<MovieController>();
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      itemCount: controller.movielist.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          controller
                                              .movielist[index].poster_path
                                              .toString()))))),
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
