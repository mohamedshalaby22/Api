import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Your Cart Is Empty',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
