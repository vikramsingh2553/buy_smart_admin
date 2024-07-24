class ProductModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final int clickCount;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.clickCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      clickCount: json['clickCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'clickCount': clickCount,
    };
  }
}
