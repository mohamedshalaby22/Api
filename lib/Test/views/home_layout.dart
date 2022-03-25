import 'package:fetch/Test/controller/bottom.dart';
import 'package:fetch/Test/views/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLayoutTest extends StatelessWidget {
  const HomeLayoutTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNaviBar>(
      init: BottomNaviBar(),
      builder: (controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          onPressed: () {
            Get.to(const SearchPage(), transition: Transition.zoom);
          },
          child: const Icon(
            Icons.search,
            size: 25,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: controller.items,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            controller.changeIndex(index);
          },
          currentIndex: controller.currentIndex,
        ),
        body: controller.pages[controller.currentIndex],
      ),
    );
  }
}
