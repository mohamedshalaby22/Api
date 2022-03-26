import 'dart:ffi';

class ProductModel {
  String? image;
  String? desc;
  String? price;
  String? title;
  String? id;
  ProductModel({
    required this.image,
    required this.desc,
    required this.price,
    required this.id,
    required this.title,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    desc = json['desc'];
    price = json['price'];
    id = json['id'];
    title = json['title'];
  }
  toJson() {
    return {
      'image': image,
      'desc': desc,
      'price': price,
      'id': id,
      'title': title,
    };
  }
}
