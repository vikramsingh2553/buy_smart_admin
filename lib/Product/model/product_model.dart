class ProductModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'No name',
      description: json['description'] ?? 'No description',
      price: json['price'] is int ? json['price'] : int.tryParse(json['price'].toString()) ?? 0,
      category: json['category'] ?? 'No category',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
    };
  }
}
