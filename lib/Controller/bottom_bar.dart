import 'package:fetch/Widgets/first.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/second.dart';
import '../Widgets/third.dart';

class BottomBar extends GetxController {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const SecondScreen(),
    const ThirdScreen(),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_work_outlined), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite_rounded), label: 'Favorite'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
  ];
  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
