import 'package:fetch/Test/views/favourite.dart';
import 'package:fetch/Test/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNaviBar extends GetxController {
  List<Widget> pages = [
    const HomePage(),
    const FavouitePage(),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'favorite'),
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
