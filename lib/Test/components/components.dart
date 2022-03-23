// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DefaultText1 extends StatelessWidget {
  DefaultText1({
    Key? key,
    required this.text,
    required this.color,
    this.size = 13,
  }) : super(key: key);
  String text;
  Color color;
  double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class DefaultText extends StatelessWidget {
  DefaultText({
    Key? key,
    this.size = 30,
    required this.text,
  }) : super(key: key);
  String text;
  double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class DefaultIcon extends StatelessWidget {
  DefaultIcon({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);
  IconData iconData;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            iconData,
            color: Colors.black,
            size: 35,
          )),
    );
  }
}
