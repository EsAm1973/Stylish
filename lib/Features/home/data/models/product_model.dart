import 'package:stylish/Features/home/data/models/category_model.dart';

class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final CategoryModel category;
  final int? originalPrice;
  final String? discount;
  final double? rating;
  final int? reviewCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
    this.originalPrice,
    this.discount,
    this.rating,
    this.reviewCount,
  });

  String get imageUrl => images.isNotEmpty ? images[0] : '';

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      price: int.parse(json['price'].toString()),
      description: json['description'],
      images: List<String>.from(json['images']),
      category: CategoryModel.fromJson(json['category']),
      originalPrice: json['originalPrice'],
      discount: json['discount'],
      rating: json['rating']?.toDouble(),
      reviewCount: json['reviewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'category': category.toJson(),
      'originalPrice': originalPrice,
      'discount': discount,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}
