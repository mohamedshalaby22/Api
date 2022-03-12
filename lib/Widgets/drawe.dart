import 'package:fetch/Constance/const.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      backgroundColor: primary,
      child: Column(
        children: const [],
      ),
    ));
  }
}
