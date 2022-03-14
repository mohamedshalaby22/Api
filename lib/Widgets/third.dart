import 'package:fetch/Components/empty_cart.dart';
import 'package:fetch/Constance/const.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: primary,
              )),
          centerTitle: true,
          title: const Text(
            'Cart Items',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: primary,
                )),
          ],
        ),
        body: const EmptyCart());
  }
}
