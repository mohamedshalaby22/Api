import 'dart:developer';

import 'package:fetch/Test/components/components.dart';
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
            )),
      ),
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
          const SizedBox(
            height: 20,
          ),
          DefaultText1(
            size: 20,
            color: Colors.black,
            text: productModel.title.toString(),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefaultText1(
              color: Colors.black,
              text: productModel.desc.toString(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        decoration: const BoxDecoration(),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              log('Added00');
            },
            child: const Text('Add to Cart',
                style: TextStyle(color: Colors.white, fontSize: 17))),
      ),
    );
  }
}
