// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constance/const.dart';
import '../Controller/movie_controller.dart';

class BuildListItem extends StatelessWidget {
  MovieController controller = Get.find<MovieController>();
  BuildListItem(
      {Key? key, required this.image, required this.name, required this.id})
      : super(key: key);
  String image;
  String name;
  int id;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width * 0.53,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.changeFavorite(id);
                  },
                  child: controller.isFavourite(id)
                      ? Icon(
                          Icons.favorite,
                          color: primary,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: backGround,
                        ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
