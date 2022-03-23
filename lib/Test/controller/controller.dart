import 'package:fetch/Test/model/model.dart';
import 'package:fetch/Test/reopsoirty/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoaing = false.obs;
  FetchDataFromApi fetchDataFromApi = FetchDataFromApi();
  var productList = <ProductModel>[].obs;

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

  List content = [
    {'name': 'Nice Face care cream', 'title': 'Woman\'s cream'},
    {'name': 'Nice Rolex watch 210', 'title': 'Mens\'s Watch'},
    {'name': 'Nice Sport Shoes', 'title': 'Mens\'s Shoes'},
  ];
}
