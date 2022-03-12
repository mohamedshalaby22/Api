import 'package:fetch/Constance/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/bottom_bar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBar>(
      init: Get.find<BottomBar>(),
      builder: (controller) => Scaffold(
        backgroundColor: backGround,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          items: controller.items,
          currentIndex: controller.currentIndex,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
        body: controller.screens[controller.currentIndex],
      ),
    );
  }
}
