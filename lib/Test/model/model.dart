class ProductModel {
  String? image;
  String? des;
  String? price;
  String? title;
  int? id;
  ProductModel({
    required this.image,
    required this.des,
    required this.price,
    required this.id,
    required this.title,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    des = json['des'];
    price = json['price'];
    id = json['id'];
    title = json['title'];
  }
  toJson() {
    return {
      'image': image,
      'des': des,
      'price': price,
      'id': id,
      'title': title,
    };
  }
}
