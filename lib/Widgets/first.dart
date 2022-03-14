// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:fetch/Components/list_items.dart';
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

  bool onPresses = false;
  @override
  Widget build(BuildContext context) {
    MovieController controller = Get.find<MovieController>();
    return Scaffold(
      drawer: const DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
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
                      controller.onPressed.value
                          ? Expanded(
                              child: TextFormField(
                                  onChanged: (value) {
                                    controller.searchListChange(value);
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: controller.text,
                                  autofocus: true,
                                  cursorColor: Colors.white,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primary)),
                                      hintText: 'Search',
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      suffixIcon:
                                          controller.text.text.isNotEmpty
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.clearSearch();
                                                  },
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ))
                                              : null)),
                            )
                          : const Image(
                              width: 100, image: AssetImage('assets/Net.png')),
                      IconButton(
                          onPressed: () {
                            controller.changePressed();
                          },
                          icon: Icon(
                            Icons.search,
                            color: primary,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
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
                  Column(
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
                      if (controller.searchList.isEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.41,
                          child: controller.searchList.isEmpty &&
                                  controller.text.text.isNotEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/1.png'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'No Result Found',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.movielist.length,
                                  itemBuilder: (context, index) => BuildListItem(
                                      image: 'https://image.tmdb.org/t/p/w500' +
                                          controller
                                              .movielist[index].poster_path
                                              .toString(),
                                      name: controller
                                          .movielist[index].original_title
                                          .toString(),
                                      id: controller.movielist[index].id!
                                          .toInt())),
                        )
                      else
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.41,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.searchList.length,
                              itemBuilder: (context, index) => BuildListItem(
                                  image: 'https://image.tmdb.org/t/p/w500' +
                                      controller.searchList[index].poster_path
                                          .toString(),
                                  name: controller
                                      .searchList[index].original_title
                                      .toString(),
                                  id: controller.searchList[index].id!
                                      .toInt())),
                        )
                    ],
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
