import 'package:fetch/Test/components/search_list.dart';
import 'package:fetch/Test/controller/controller.dart';
import 'package:fetch/Test/views/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Obx(
          () => Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xffe5f0f3),
                      ),
                      child: TextFormField(
                        controller: controller.textsearch,
                        onChanged: (value) {
                          controller.searchitems(value);
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search....',
                            suffixIcon: controller.textsearch.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      controller.removeSearch();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ))
                                : null),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (controller.searchList.isEmpty)
                Expanded(
                  child: controller.searchList.isEmpty &&
                          controller.textsearch.text.isNotEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/1.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'No Result Found',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20),
                          itemBuilder: (context, index) => SearchList(
                                image: controller.productList[index].image
                                    .toString(),
                              )),
                )
              else
                Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.searchList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      itemBuilder: (context, index) => SearchList(
                            image:
                                controller.searchList[index].image.toString(),
                          )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
