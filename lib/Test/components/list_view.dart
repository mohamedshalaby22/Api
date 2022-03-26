// ignore_for_file: must_be_immutable

import 'package:fetch/Test/components/components.dart';
import 'package:fetch/Test/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultListView extends StatelessWidget {
  DefaultListView({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.id,
  }) : super(key: key);
  String image;
  String name;
  String price;
  String id;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 170,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xffe5f0f3),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: image,
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(image))),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DefaultText(
                    text: '\$$price',
                    size: 20,
                  ),
                  DefaultText1(
                      size: 15, text: 'price', color: Colors.grey.shade600),
                ],
              ),
              Obx(
                () => CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {
                        //controller.favouriteChange(id);
                      },
                      icon: controller.isFavoriteList(id)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
