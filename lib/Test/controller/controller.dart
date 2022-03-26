import 'package:fetch/Test/model/model.dart';
import 'package:fetch/Test/reopsoirty/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoaing = false.obs;
  FetchDataFromApi fetchDataFromApi = FetchDataFromApi();
  var productList = <ProductModel>[].obs;
  var favouriteList = <ProductModel>[].obs;
  var searchList = <ProductModel>[].obs;
  var textsearch = TextEditingController();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    isLoaing(true);
    List list = await fetchDataFromApi.setData();
    productList.addAll(list.map((e) => ProductModel.fromJson(e)).toList());
    isLoaing(false);
  }

  var currentIndex = 0.obs;
  void pageView(int value) {
    currentIndex.value = value;
  }

  void searchitems(String value) {
    searchList.value = productList
        .where((search) => search.title!.toLowerCase().contains(value))
        .toList();
  }

  void removeSearch() {
    textsearch.clear();
    searchitems('');
  }

/////////////////////////
  void favouriteChange(String productId) {
    favouriteList
        .add(productList.firstWhere((element) => element.id == productId));
  }

  bool isFavoriteList(String productId) {
    return favouriteList.any((element) => element.id == productId);
  }

/////////////////////////
  List content = [
    {'name': 'Nice Face care cream', 'title': 'Personal Work'},
    {'name': 'Nice Rolex watch 210', 'title': 'Popular Laptop'},
    {'name': 'Nice Sport Shoes', 'title': 'Desktop Accessories'},
  ];
}
