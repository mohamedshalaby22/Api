// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:fetch/Constance/const.dart';
import 'package:fetch/Controller/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 10) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MovieController controller = Get.find<MovieController>();
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        centerTitle: true,
        title: const Image(width: 100, image: AssetImage('assets/Net.png')),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.short_text,
                color: primary,
                size: 30,
              ),
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,

              //color: Colors.red,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        controller
                                            .movielist[index].backdrop_path
                                            .toString())),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My List',
                              style: TextStyle(color: primary, fontSize: 17),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: primary,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.41,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.movielist.length,
                              itemBuilder: (context, index) => BuildListItem(
                                  image: 'https://image.tmdb.org/t/p/w500' +
                                      controller.movielist[index].poster_path
                                          .toString(),
                                  name: controller
                                      .movielist[index].original_title
                                      .toString(),
                                  id: controller.movielist[index].id!.toInt())),
                        )
                      ],
                    ))
              ],
            );
          }
        }),
      ),
    );
  }
}

class BuildListItem extends StatelessWidget {
  MovieController controller = Get.find<MovieController>();
  BuildListItem(
      {Key? key, required this.image, required this.name, required this.id})
      : super(key: key);
  String image;
  String name;
  int id;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width * 0.53,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.changeFavorite(id);
                  },
                  child: controller.isFavourite(id)
                      ? Icon(
                          Icons.favorite,
                          color: primary,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: backGround,
                        ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
