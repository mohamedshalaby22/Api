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
    {'name': 'Nice Face care cream', 'title': 'Personal Work'},
    {'name': 'Nice Rolex watch 210', 'title': 'Popular Laptop'},
    {'name': 'Nice Sport Shoes', 'title': 'Desktop Accessories'},
  ];

  List data = [
    {
      'image':
          'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'name': 'Mackbook Pro 2020',
      'des':
          'The MacBook Pro is a line of Macintosh notebook computers introduced in January 2006 by Apple Inc',
      'price': '320',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGFwdG9wc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'name': 'Dell 5520 G3',
      'des':
          'Screen size: Dell laptops come in every size imaginable, from 11 inches to 18 inches',
      'price': '230',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1493723843671-1d655e66ac1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGxhcHRvcHMlMjB3aGl0ZSUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'name': 'Combo Accessories',
      'des': 'K585 Beautiful Keyboard with M721 Mouse',
      'price': '140',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1632633173522-47456de71b76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGlwaG9uZSUyMDEzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'name': 'Iphone 13 Pro Max',
      'des':
          'The iPhone 13 mini display has rounded corners that follow a beautiful curved design',
      'price': '430',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1628591459313-a64214c5bfac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFwcGxlJTIwdGFibGV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'name': 'Apple Tablet',
      'des':
          'Liquid Retina XDR display 1. 11” Liquid Retina display 1. M1 chip',
      'price': '210',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdsYXNzZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'name': 'Special Sunglass',
      'des': 'Sunski CR-39 lenses are featured in all our premium sunglasses',
      'price': '95',
    },
    {
      'image':
          'https://media.istockphoto.com/photos/luxury-watch-isolated-on-white-background-with-clipping-path-for-or-picture-id1180244659?b=1&k=20&m=1180244659&s=170667a&w=0&h=apyCu-r2h8VxOltgwqfC8rdhBPZsw2xtch_LFlKvFrM=',
      'name': 'Hand Watch',
      'des':
          'Watch Hands To Fit Minute Hand Hole Size .90mm And Hour Hand Hole Size 1.50mm',
      'price': '190',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1613040809024-b4ef7ba99bc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGhlYWRwaG9uZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'name': 'Apple headphone',
      'des': 'The Apple headphone Max Wireless are the best noise cancelling',
      'price': '185',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1610792516307-ea5acd9c3b00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHNhbXN1bmclMjBnYWxheHl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'name': 'samsung galaxy S21',
      'des':
          'Galaxy S21+ 5G 6.7" flat FHD+ Dynamic AMOLED 2X Infinity-O Display (2400x1080).',
      'price': '130',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1527814050087-3793815479db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fG1vdXNlJTIwcGFkfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'name': 'Logitech Wireless Mouse',
      'des': 'The Logitech G502 LIGHTSPEED wireless gaming mouse',
      'price': '60',
    },
  ];
}
