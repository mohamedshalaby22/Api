// ignore_for_file: must_be_immutable

import 'package:fetch/Test/components/components.dart';
import 'package:fetch/Test/components/list_view.dart';
import 'package:fetch/Test/controller/controller.dart';
import 'package:fetch/Test/views/detail.dart';
import 'package:fetch/Test/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      drawer: const DefaultDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.transparent, size: 60),
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoaing.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xffbb471a),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (BuildContext context) {
                      return DefaultIcon(
                        iconData: Icons.sort_sharp,
                        onTap: () {
                          // Scaffold.of(context).openDrawer();
                        },
                      );
                    }),
                    DefaultIcon(
                      iconData: Icons.shopping_bag_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'New Collection',
                        size: 25,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultText1(
                        text: 'Original Products 2022',
                        color: const Color(0xffbb471a),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      controller.pageView(value);
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) => PageViewList(
                      image: controller.productList[index].image.toString(),
                      name: controller.productList[index].title.toString(),
                      title: controller.content[index]['title'],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: const EdgeInsets.only(right: 5),
                            width:
                                controller.currentIndex.value == index ? 30 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                                color: controller.currentIndex.value == index
                                    ? const Color(0xffbb471a)
                                    : Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(10)),
                          )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'LifeStyle',
                        size: 25,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productList.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(
                                  DetailPage(
                                      productModel:
                                          controller.productList[index]),
                                  transition: Transition.leftToRight);
                            },
                            child: DefaultListView(
                              image: controller.productList[index].image
                                  .toString(),
                              name: controller.productList[index].title
                                  .toString(),
                              price: controller.productList[index].price
                                  .toString(),
                              id: controller.productList[index].id.toString(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
