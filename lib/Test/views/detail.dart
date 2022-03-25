import 'package:fetch/Test/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xffe5f0f3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                    tag: productModel.image.toString(),
                    child: Image(
                        image: NetworkImage(productModel.image.toString())))),
          ),
        ],
      ),
    );
  }
}
